package main

import (
	"database/sql"
	"fmt"
	"os"
)

const (
	dbDriverName = "mysql"
	userName     = "web"
	userPass     = "214550"
)

func main() {
	db, err := openDB()
	if err != nil {
		fmt.Print(err)
	}

	f, err := os.Open("aforizm.txt")
	if err != nil {
		panic(err)
	}

	fmt.Print(db)
	fmt.Print(f)
}

func openDB() (*sql.DB, error) {
	return sql.Open(dbDriverName, userName+":"+userPass+"@tcp(localhost:3306)/blog?charset=utf8mb4&collation=utf8mb4_unicode_ci&parseTime=true")
}
