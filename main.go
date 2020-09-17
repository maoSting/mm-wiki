package main

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
	_ "github.com/astaxie/beego/session/memcache"
	_ "github.com/astaxie/beego/session/redis"
	_ "github.com/astaxie/beego/session/redis_cluster"
	_ "github.com/phachon/mm-wiki/app"
)

func main() {
	//logs.SetLogFuncCall(true)
	//logs.SetLevel(logs.LevelDebug)
	//beego.ErrorHandler("404", pageError)

	log := logs.NewLogger()
	log.Debug("wow main thing going on")

	beego.Run()
}

//func pageError(rw http.ResponseWriter, req *http.Request) {
//	t, _ := template.New("404.html").ParseFiles(beego.BConfig.WebConfig.ViewsPath + "/error/404.html")
//	data := make(map[string]interface{})
//	data["content"] = "page not found"
//	data["copyright"] = app.CopyRight
//	t.Execute(rw, data)
//}
