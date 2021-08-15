package main

import "os"

type PageHeader struct {
	PageType            uint8
	FirstFreeBlockStart uint16
	NumberOfCells       uint16
	StartOfContentArea  uint16
	FragmentedFreeBytes uint8
}

func parsePageHeader(databaseFile *os.File) PageHeader {
	pageType := parseUInt8(databaseFile)
	firstFreeBlockStart := parseUInt16(databaseFile)
	numberOfCells := parseUInt16(databaseFile)
	startOfContentArea := parseUInt16(databaseFile)
	fragmentedFreeBytes := parseUInt8(databaseFile)

	return PageHeader{
		PageType:            pageType,
		FirstFreeBlockStart: firstFreeBlockStart,
		NumberOfCells:       numberOfCells,
		StartOfContentArea:  startOfContentArea,
		FragmentedFreeBytes: fragmentedFreeBytes,
	}
}
