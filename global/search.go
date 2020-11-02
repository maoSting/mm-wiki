package global

import (
	"github.com/algolia/algoliasearch-client-go/v3/algolia/search"
	"github.com/go-ego/riot"
)

// 文档搜索
var (
	DocSearcher   = riot.Engine{}
	SearchClient  = &search.Client{}
	DocumentIndex = &search.Index{}
)
