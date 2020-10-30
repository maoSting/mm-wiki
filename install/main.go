package main

import (
	"flag"
	"github.com/astaxie/beego"
	"log"
	"mm-wiki/app/utils"
	"mm-wiki/install/storage"
	"os"
	"path/filepath"
)

// install

var (
	port = flag.String("port", "8090", "please input listen port")
)

func main() {
	flag.Parse()

	_, err := os.Stat(filepath.Join(storage.RootDir, "./install.lock"))
	if err == nil || !os.IsNotExist(err) {
		log.Println("MM-Wiki already installed!")
		os.Exit(1)
	}

	// add template func
	beego.AddFuncMap("dateFormat", utils.NewDate().Format)

	//beego.BConfig.RunMode = "prod"
	beego.Run(":" + *port)
}
