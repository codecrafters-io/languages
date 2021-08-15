package main

import (
	"io"
)

const IS_FIRST_BIT_ZERO_MASK = 0b10000000
const LAST_SEVEN_BITS_MASK = 0b01111111

func parseVarint(stream io.Reader) int {
	result := 0

	for index, usableByteAsInt := range readUsableBytesAsInts(stream) {
		var usableSize int

		if index == 8 {
			usableSize = 8
		} else {
			usableSize = 7
		}

		shifted := result << usableSize
		result = shifted + usableValue(usableSize, usableByteAsInt)
	}

	return result
}

func usableValue(usableSize int, usableByteAsInt int) int {
	if usableSize == 8 {
		return usableByteAsInt
	} else {
		return usableByteAsInt & LAST_SEVEN_BITS_MASK
	}
}

func readUsableBytesAsInts(stream io.Reader) []int {
	var usableBytesAsInts []int

	for i := 0; i <= 8; i++ {
		byteAsInt := parseUInt8(stream)
		usableBytesAsInts = append(usableBytesAsInts, int(byteAsInt))

		if byteAsInt&IS_FIRST_BIT_ZERO_MASK == 0 {
			break
		}
	}

	return usableBytesAsInts
}
