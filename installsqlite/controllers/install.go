package controllers

type InstallController struct {
	BaseController
}

func (this *InstallController) Index() {
	this.view("installsqlite/index")
}

func (this *InstallController) License() {

}
