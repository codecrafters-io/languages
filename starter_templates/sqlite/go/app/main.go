package main

import (
	"fmt"
	"io"
	"log"
	"os"
	// Available if you need it!
	// "github.com/pingcap/parser"
	// "github.com/pingcap/parser/ast"
)

type SQLiteSchemaRow struct {
	_type    string // _type since type is a reserved keyword
	name     string
	tblName  string
	rootPage int
	sql      string
}

// Usage: your_sqlite3.sh sample.db .dbinfo
func main() {
	databaseFilePath := os.Args[1]
	command := os.Args[2]

	switch command {
	case ".dbinfo":
		databaseFile, err := os.Open(databaseFilePath)
		if err != nil {
			log.Fatal(err)
		}

		_, _ = databaseFile.Seek(100, io.SeekStart) // Skip the database header

		pageHeader := parsePageHeader(databaseFile)

		cellPointers := make([]uint16, pageHeader.NumberOfCells)

		for i := 0; i < int(pageHeader.NumberOfCells); i++ {
			cellPointers[i] = parseUInt16(databaseFile)
		}

		var sqliteSchemaRows []SQLiteSchemaRow

		for _, cellPointer := range cellPointers {
			_, _ = databaseFile.Seek(int64(cellPointer), io.SeekStart)
			parseVarint(databaseFile) // number of bytes in payload
			parseVarint(databaseFile) // rowid
			record := parseRecord(databaseFile, 5)

			sqliteSchemaRows = append(sqliteSchemaRows, SQLiteSchemaRow{
				_type:    string(record.values[0].([]byte)),
				name:     string(record.values[1].([]byte)),
				tblName:  string(record.values[2].([]byte)),
				rootPage: int(record.values[3].(uint8)),
				sql:      string(record.values[4].([]byte)),
			})
		}

		fmt.Println("Your code goes here!")

		// Uncomment this to pass the first stage
		// fmt.Printf("number of tables: %v", len(sqliteSchemaRows))
	default:
		fmt.Println("Unknown command", command)
		os.Exit(1)
	}
}
