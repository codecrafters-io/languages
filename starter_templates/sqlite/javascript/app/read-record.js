import readInt from "./read-int.js";
import readVarint from "./read-varint.js";

// Reads SQLite's "Record Format" as mentioned here: https://www.sqlite.org/fileformat.html#record_format
export default async function readRecord(databaseFile, numberOfValues) {
  await readVarint(databaseFile); // number of bytes in header

  const serialTypes = [];

  for (let i = 0; i < numberOfValues; i++) {
    serialTypes.push(await readVarint(databaseFile));
  }

  const recordValues = [];

  for (const serialType of serialTypes) {
    recordValues.push(await readRecordValue(databaseFile, serialType));
  }

  return recordValues;
}

async function readRecordValue(databaseFile, serialType) {
  if (serialType >= 13 && serialType % 2 === 1) {
    // Text encoding
    const numberOfBytes = (serialType - 13) / 2;
    return (await databaseFile.read(numberOfBytes)).toString("utf-8");
  } else if (serialType === 1) {
    // 8-bit twos-complement integer
    return await readInt(databaseFile, 1);
  } else {
    throw `Unhandled serialType: ${serialType}`;
  }
}
