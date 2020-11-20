package controllers

import (
	"github.com/algolia/algoliasearch-client-go/v3/algolia/opt"
	"mm-wiki/app/models"
	"mm-wiki/app/services"
	"mm-wiki/app/utils"
	"mm-wiki/global"
	"strings"
)

type FrontController struct {
	BaseController
}

func (this *FrontController) Index() {
	page, _ := this.GetInt("page", 1)
	number, _ := this.GetRangeInt("number", 20, 10, 100)

	limit := (page - 1) * number
	var err error
	var count int64

	var spaces []map[string]string
	spaces, err = models.SpaceModel.GetSpacesByVisitLevel(models.Space_VisitLevel_Release)

	if err != nil {

	}
	spaceIds := []string{}
	for _, space := range spaces {
		documentNum, _ := models.DocumentModel.CountPageDocumentsBySpaceId(space["space_id"])
		count = documentNum + count
		spaceIds = append(spaceIds, space["space_id"])
	}
	documents, _ := models.DocumentModel.GetDocumentsBySpaceIdsDocumentLimit(spaceIds, limit, number)

	this.Data["documents"] = documents
	this.Data["count"] = count
	this.SetPaginator(number, count)

	this.viewLayout("front/view", "layout_front")
}

func (this *FrontController) Detail() {
	documentId := this.GetString("document_id", "")
	if documentId == "" {
		this.ViewFrontError("文档未找到！")
		return
	}

	document, err := models.DocumentModel.GetDocumentByDocumentId(documentId)
	if err != nil {
		this.ErrorLog("查找文档 " + documentId + " 失败：" + err.Error())
		this.ViewFrontError("查找文档失败！")
		return
	}
	if len(document) == 0 {
		this.ViewFrontError("文档不存在！")
		return
	}

	spaceId := document["space_id"]
	space, err := models.SpaceModel.GetSpaceBySpaceId(spaceId)
	if err != nil {
		this.ErrorLog("查找文档 " + documentId + " 所在空间失败：" + err.Error())
		this.ViewFrontError("查找文档失败！")
	}
	if len(space) == 0 {
		this.ViewFrontError("文档所在空间不存在！")
	}
	// check space visit_level
	//isVisit, isEditor, _ := this.GetDocumentPrivilege(space)
	//if !isVisit {
	//	this.ViewFrontError("您没有权限访问该空间！")
	//}

	// get parent documents by document
	parentDocuments, pageFile, err := models.DocumentModel.GetParentDocumentsByDocument(document)
	if err != nil {
		this.ErrorLog("查找父文档失败：" + err.Error())
		this.ViewFrontError("查找父文档失败！")
	}

	if len(parentDocuments) == 0 {
		this.ViewFrontError("父文档不存在！")
	}

	// get document content
	documentContent, err := utils.Document.GetContentByPageFile(pageFile)
	if err != nil {
		this.ErrorLog("查找文档 " + documentId + " 失败：" + err.Error())
		this.ViewFrontError("文档不存在！")
	}

	// get edit user and create user
	users, err := models.UserModel.GetUsersByUserIds([]string{document["create_user_id"], document["edit_user_id"]})
	if err != nil {
		this.ErrorLog("查找文档 " + documentId + " 失败：" + err.Error())
		this.ViewFrontError("查找文档失败！")
	}
	if len(users) == 0 {
		this.ViewFrontError("文档创建用户不存在！")
	}

	var createUser = map[string]string{}
	var editUser = map[string]string{}
	for _, user := range users {
		if user["user_id"] == document["create_user_id"] {
			createUser = user
		}
		if user["user_id"] == document["edit_user_id"] {
			editUser = user
		}
	}

	collectionId := "0"
	collection, err := models.CollectionModel.GetCollectionByUserIdTypeAndResourceId(this.UserId, models.Collection_Type_Doc, documentId)
	if err != nil {
		this.ErrorLog("查找文档 " + documentId + " 失败：" + err.Error())
		this.ViewFrontError("文档查找失败！")
	}
	if len(collection) > 0 {
		collectionId = collection["collection_id"]
	}

	this.Data["page_title"] = document["name"]
	this.Data["space"] = space
	this.Data["create_user"] = createUser
	this.Data["edit_user"] = editUser
	this.Data["document"] = document
	this.Data["collection_id"] = collectionId
	this.Data["page_content"] = documentContent
	this.Data["parent_documents"] = parentDocuments
	this.viewLayout("front/detail", "layout_front")
}

func (this *FrontController) Search() {
	keyword := strings.TrimSpace(this.GetString("keyword", ""))
	searchType := "content"

	this.Data["search_type"] = searchType
	this.Data["keyword"] = keyword
	this.Data["count"] = 0
	if keyword == "" {
		this.viewLayout("front/search", "layout_front")
		return
	}
	var documents = []map[string]string{}
	var err error
	// 获取该用户有权限的空间
	ReleaseSpaces, err := models.SpaceModel.GetSpacesByVisitLevel(models.Space_VisitLevel_Release)
	if err != nil {
		this.ErrorLog("搜索文档列表获取用户空间权限出错：" + err.Error())
		this.ViewFrontError("搜索文档错误！")
	}
	spaceIdsMap := make(map[string]bool)
	for _, publicSpace := range ReleaseSpaces {
		spaceIdsMap[publicSpace["space_id"]] = true
	}
	searchDocContents := make(map[string]string)

	// 默认根据内容搜索
	searchRes, err := global.DocumentIndex.Search(keyword,
		opt.HighlightPreTag("<mark>"),
		opt.HighlightPostTag("</mark>"),
		opt.ResponseFields("hits", "nbHits"),
		//opt.AttributesToSnippet("content:100"),
	)

	if err != nil {
		this.viewLayout("front/search", "layout_front")
		return
	}

	searchDocIds := []string{}
	var documentIndex []services.DocumentIndicesIndex

	err = searchRes.UnmarshalHits(&documentIndex)
	if err != nil {
		this.viewLayout("front/search", "layout_front")
		return
	}
	for _, searchDoc := range documentIndex {
		docId := searchDoc.ObjectID
		content := searchDoc.Content

		locIndex := strings.Index(content, keyword)
		if locIndex < 0 {
			continue
		}
		searchContent := utils.Misc.SubStrUnicodeBySubStrIndex(content, keyword, locIndex, 30, 30)
		searchDocContents[docId] = searchContent
		searchDocIds = append(searchDocIds, docId)
	}
	documents, err = models.DocumentModel.GetDocumentsByDocumentIds(searchDocIds)
	if err != nil {
		this.ErrorLog("搜索文档出错：" + err.Error())
		this.ViewFrontError("搜索文档错误！")
	}
	//// 过滤一下没权限的空间
	realDocuments := []map[string]string{}
	for _, document := range documents {
		spaceId, _ := document["space_id"]
		documentId, _ := document["document_id"]
		if _, ok := spaceIdsMap[spaceId]; !ok {
			continue
		}
		if searchType != "title" {
			searchContent, ok := searchDocContents[documentId]
			if !ok || searchContent == "" {
				continue
			}
			document["search_content"] = searchContent
		}
		realDocuments = append(realDocuments, document)
	}

	this.Data["search_type"] = searchType
	this.Data["keyword"] = keyword
	this.Data["page_title"] = keyword
	this.Data["documents"] = realDocuments
	this.Data["count"] = len(realDocuments)
	this.viewLayout("front/search", "layout_front")
}

// view layout
func (this *FrontController) ViewFrontError(content string, redirect ...string) {
	var url = ""
	var sleep = "5"
	if len(redirect) == 1 {
		url = redirect[0]
	}
	if len(redirect) > 1 {
		sleep = redirect[1]
	}
	if content == "" {
		content = "操作失败"
	}
	this.Data["content"] = content
	this.Data["url"] = url
	this.Data["sleep"] = sleep
	this.Data["copyright"] = "yuyinmp3.com"
	this.viewLayout("error/front", "layout_front")
}
