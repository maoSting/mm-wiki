module github.com/phachon/mm-wiki

go 1.12

replace github.com/coreos/go-systemd => ./vendor/github.com/coreos/go-systemd

replace github.com/vcaesar/murmur => ./vendor/github.com/go-ego/murmur

require (
	github.com/asaskevich/govalidator v0.0.0-20190424111038-f61b66f89f4a // indirect
	github.com/astaxie/beego v1.12.0
	github.com/fatih/color v1.7.0
	github.com/go-ego/riot v0.0.0-20200611143841-c7c8c77eaf1a
	github.com/go-ldap/ldap/v3 v3.1.11
	github.com/go-ozzo/ozzo-validation v3.6.0+incompatible
	github.com/go-sql-driver/mysql v1.4.1
	github.com/mattn/go-colorable v0.1.4 // indirect
	github.com/mattn/go-isatty v0.0.10 // indirect
	github.com/onsi/ginkgo v1.10.3 // indirect
	github.com/onsi/gomega v1.7.1 // indirect
	github.com/shiena/ansicolor v0.0.0-20151119151921-a422bbe96644 // indirect
	github.com/shirou/gopsutil v2.20.5+incompatible
	github.com/shurcooL/sanitized_anchor_name v1.0.0 // indirect
	github.com/snail007/go-activerecord v0.0.0-20200729014052-c52486828493
	gopkg.in/alexcesaro/quotedprintable.v3 v3.0.0-20150716171945-2caba252f4dc // indirect
	gopkg.in/gomail.v2 v2.0.0-20160411212932-81ebce5c23df
	gopkg.in/russross/blackfriday.v2 v2.0.0
)
