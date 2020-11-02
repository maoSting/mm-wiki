package services

import (
	"sync"

	"mm-wiki/app/models"
	"mm-wiki/global"

	"github.com/astaxie/beego/logs"
)

var AlgoliaIndexService = NewAlgoliaIndexService()

type DocumentIndicesIndex struct {
	ObjectID string `json:"objectID"`
	Content  string `json:"content"`
}

type AlgoliaIndex struct {
}

func NewAlgoliaIndexService() *AlgoliaIndex {
	return &AlgoliaIndex{}
}

func (ai *AlgoliaIndex) IsUpdateDocIndex() bool {
	fulltextSearchOpen := models.ConfigModel.GetConfigValueByKey(models.ConfigKeyFulltextSearch, "0")
	if fulltextSearchOpen == "1" {
		return true
	}
	return false
}

// ForceDelDocIdIndex 强制删除索引
func (ai *AlgoliaIndex) ForceDelDocIdIndex(docId string) {
	if docId == "" {
		return
	}
	if !ai.IsUpdateDocIndex() {
		return
	}
	// add search index
	global.DocumentIndex.DeleteObject(docId)
}

// UpdateDocIndex 更新单个文件的索引
func (ai *AlgoliaIndex) ForceUpdateDocIndexByDocId(docId string) error {
	if docId == "" {
		return nil
	}
	if !ai.IsUpdateDocIndex() {
		return nil
	}
	doc, err := models.DocumentModel.GetDocumentByDocumentId(docId)
	if err != nil {
		return err
	}
	content, _, err := models.DocumentModel.GetDocumentContentByDocument(doc)
	if err != nil {
		return err
	}
	// add search index
	_, err = global.DocumentIndex.SaveObject(DocumentIndicesIndex{ObjectID: docId, Content: content})
	if err != nil {
		return err
	}
	return nil
}

// UpdateDocIndex 更新单个文件的索引
func (ai *AlgoliaIndex) UpdateDocIndex(doc map[string]string) {
	docId, ok := doc["document_id"]
	if !ok || docId == "" {
		return
	}
	if !ai.IsUpdateDocIndex() {
		return
	}
	content, _, err := models.DocumentModel.GetDocumentContentByDocument(doc)
	if err != nil {
		logs.Error("[UpdateDocIndex] get documentId=%s content err: %s", docId, err.Error())
		return
	}
	// add search index
	global.DocumentIndex.SaveObject(DocumentIndicesIndex{ObjectID: docId, Content: content})
}

// UpdateDocsIndex 批量更新多个文件的索引
func (ai *AlgoliaIndex) UpdateDocsIndex(docs []map[string]string) {
	if len(docs) == 0 {
		return
	}
	wait := sync.WaitGroup{}
	for _, doc := range docs {
		if len(doc) == 0 {
			continue
		}
		wait.Add(1)
		go func(doc map[string]string) {
			docId, _ := doc["document_id"]
			defer func() {
				if e := recover(); e != nil {
					logs.Error("[UpdateAllDocIndex] get documentId=%s content panic: %v", docId, e)
				}
				wait.Done()
			}()
			ai.UpdateDocIndex(doc)
		}(doc)
	}
	wait.Wait()
}

// UpdateAllDocIndex 更新所有的文档
func (ai *AlgoliaIndex) UpdateAllDocIndex(batchNum int) {
	if !ai.IsUpdateDocIndex() {
		return
	}
	allDocs, err := models.DocumentModel.GetAllDocuments()
	if err != nil {
		logs.Error("[UpdateAllDocIndex] getAllDocuments err: %s", err.Error())
		return
	}
	batchDocs := ai.getBatchDocs(allDocs, batchNum)
	for _, docs := range batchDocs {
		ai.UpdateDocsIndex(docs)
	}
}

// 获取分批文档
func (ai *AlgoliaIndex) getBatchDocs(allDocs []map[string]string, n int) [][]map[string]string {

	groupNum := len(allDocs) / n
	remainder := len(allDocs) % n
	res := [][]map[string]string{}
	if groupNum == 0 {
		res = append(res, allDocs)
		return res
	}
	for i := 0; i < groupNum; i++ {
		offset := i * n
		resItem := allDocs[offset : n+offset]
		res = append(res, resItem)
	}
	if remainder > 0 {
		res = append(res, allDocs[len(allDocs)-remainder:])
	}
	return res
}

// FlushIndex 所有索引
func (ai *AlgoliaIndex) Flush() {

}
