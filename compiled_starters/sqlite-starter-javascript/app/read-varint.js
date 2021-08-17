import readInt from './read-int.js';

const IS_FIRST_BIT_ZERO_MASK = 0b10000000;
const LAST_SEVEN_BITS_MASK = 0b01111111;

// Reads SQLite's "varint" (short for variable-length integer) as mentioned here: https://www.sqlite.org/fileformat2.html#varint
export default async function readVarint(databaseFile) {
    const usableBytes = await readUsableBytes(databaseFile)

    let value = 0;

    usableBytes.forEach((usableByte, index) => {
        let usableSize = index === 8 ? 8 : 7; // For all bytes except the 9th one, the first bit is ignored.

        let shifted = value << usableSize;
        value = shifted + usableValue(usableSize, usableByte)
    });

    return value;
}

function usableValue(usableSize, byte) {
    // usableSize is either 8 or 7. If it is 7, we ignore the first bit and extract the last seven bits.
    return usableSize === 8 ? byte : (byte & LAST_SEVEN_BITS_MASK);
}

// A varint contains anywhere between 1-9 bytes.
async function readUsableBytes(databaseFile) {
    const usableBytes = [];

    for (let i = 0; i < 8; i++) {
        const byte = await readInt(databaseFile, 1);
        usableBytes.push(byte);

        if (isFirstBitZero(byte)) {
            break;
        }
    }

    return usableBytes;
}

function isFirstBitZero(byte) {
    return (byte & IS_FIRST_BIT_ZERO_MASK) === 0;
}
