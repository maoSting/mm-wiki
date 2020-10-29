package tasks

import (
	"fmt"
	"time"
)

func Restart() bool {
	fmt.Println("task")
	fmt.Println(time.Now().Second())

	//gseFile := filepath.Join(RootDir, "docs/search_dict/dictionary.txt")
	//stopFile := filepath.Join(RootDir, "docs/search_dict/stop_tokens.txt")
	//ok, _ := utils.File.PathIsExists(gseFile)
	//if !ok {
	//	logs.Error("search dict file " + gseFile + " is not exists!")
	//	os.Exit(1)
	//}
	//ok, _ = utils.File.PathIsExists(stopFile)
	//if !ok {
	//	logs.Error("search stop dict file " + stopFile + " is not exists!")
	//	os.Exit(1)
	//}
	//fmt.Println("gseFile")
	//fmt.Println(gseFile)
	//global.DocSearcher.Init(types.EngineOpts{
	//	NumGseThreads:     1,
	//	NumIndexerThreads: 1,
	//	NumRankerThreads:  1,
	//	UseStore:          true,
	//	StoreFolder:       SearchIndexAbsDir,
	//	Using:             3,
	//	//GseDict:           "zh",
	//	GseDict:       gseFile,
	//	StopTokenFile: stopFile,
	//	IndexerOpts: &types.IndexerOpts{
	//		IndexType: types.LocsIndex,
	//	},
	//})
	//fmt.Println("initSearch")
	//fmt.Println(gseFile)
	//
	//work.DocSearchWorker.Start()
	return true
}
