package front

import (
	"fmt"
	"mm-wiki/app/controllers"
	"mm-wiki/app/models"
)

type FrontController struct {
	controllers.BaseController
}

func (this *FrontController) Index() {
	page, _ := this.GetInt("page", 1)
	number, _ := this.GetRangeInt("number", 20, 10, 100)

	limit := (page - 1) * number
	var err error
	var count int64
	spaces = []map[string]string{}
	spaces, err = models.SpaceModel.GetSpacesByVisitLevel(models.Space_VisitLevel_Private)
	fmt.Println("Index")
	fmt.Println(spaces)
	if err != nil {

	}
	spaceIds := []string{}
	for _, space := range spaces {
		documentNum, _ := models.DocumentModel.CountDocumentsBySpaceId(space["space_id"])
		count = documentNum + count
		spaceIds = append(spaceIds, space["space_id"])
	}
	documents, _ := models.DocumentModel.GetDocumentsBySpaceIdsDocumentLimit(spaceIds, limit, number)

	this.Data["document"] = documents
	this.Data["count"] = count
	this.SetPaginator(number, count)

	this.ViewLayout("front/view", "document_page")
}
