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
	log := logs.NewLogger()
	log.Debug("wow main thing going on")

	beego.Run()
}
