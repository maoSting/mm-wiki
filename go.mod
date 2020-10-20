module mm-wiki

go 1.12

replace github.com/vcaesar/murmur => ./vendor/github.com/go-ego/murmur

replace github.com/coreos/go-systemd => ./vendor/github.com/coreos/go-systemd

replace github.com/phachon/mm-wiki => ./

replace github.com/snail007/go-activerecord v0.0.0-20200729014052-c52486828493 => github.com/maoSting/go-activerecord v0.0.0-20200930092352-431455e53b5f

require (
	github.com/astaxie/beego v1.12.0
	github.com/fatih/color v1.7.0
	github.com/go-ego/riot v0.0.0-20200611143841-c7c8c77eaf1a
	github.com/go-ldap/ldap/v3 v3.1.11
	github.com/go-ozzo/ozzo-validation v3.6.0+incompatible
	github.com/go-sql-driver/mysql v1.4.1
	github.com/mattn/go-colorable v0.1.8 // indirect
	github.com/phachon/mm-wiki v0.2.1
	github.com/shiena/ansicolor v0.0.0-20200904210342-c7312218db18 // indirect
	github.com/shirou/gopsutil v2.20.5+incompatible
	github.com/shurcooL/sanitized_anchor_name v1.0.0 // indirect
	github.com/snail007/go-activerecord v0.0.0-20200729014052-c52486828493
	gopkg.in/gomail.v2 v2.0.0-20160411212932-81ebce5c23df
	gopkg.in/russross/blackfriday.v2 v2.0.0
)
