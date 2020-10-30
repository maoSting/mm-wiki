package main

import (
	"flag"
	"github.com/astaxie/beego"
	"mm-wiki/app/utils"
	"mm-wiki/installsqlite/controllers"
	"mm-wiki/installsqlite/storage"
	"os"
	"path/filepath"
)

var (
	port = flag.String("port", "8090", "please input listen port")
)

func main() {
	flag.Parse()

	beego.AutoRouter(&controllers.InstallController{})
	beego.Router("/", &controllers.InstallController{}, "*:Index")

	beego.Run(":" + *port)
}

func init() {
	storage.InstallDir, _ = filepath.Abs(filepath.Dir(os.Args[0]))

	storage.RootDir = filepath.Join(storage.InstallDir, "../")

	beego.SetStaticPath("/static/", filepath.Join(storage.RootDir, "./static/"))
	beego.SetViewsPath(filepath.Join(storage.RootDir, "./views/"))

	beego.BConfig.RouterCaseSensitive = false

	beego.AddFuncMap("dateFormat", utils.NewDate().Format)
}
