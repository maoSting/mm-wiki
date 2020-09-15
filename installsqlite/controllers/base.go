package controllers

import "github.com/astaxie/beego"

type BaseController struct {
	beego.Controller
}

func (this *BaseController) view(viewName string) {
	this.Layout = "installsqlite/layout.html"
	this.TplName = viewName + ".html"
	this.Render()
}
