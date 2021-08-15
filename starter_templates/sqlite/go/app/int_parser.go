package main

import (
	"encoding/binary"
	"io"
	"log"
)

func parseUInt8(stream io.Reader) uint8 {
	var result uint8

	if err := binary.Read(stream, binary.BigEndian, &result); err != nil {
		log.Fatalf("Error when reading uint8: %v", err)
	}

	return result
}

func parseUInt16(stream io.Reader) uint16 {
	var result uint16

	if err := binary.Read(stream, binary.BigEndian, &result); err != nil {
		log.Fatalf("Error when reading uint8: %v", err)
	}

	return result
}
