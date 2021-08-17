export default async function readInt(databaseFile, sizeInBytes) {
  const buffer = await databaseFile.read(sizeInBytes);

  if (sizeInBytes === 1) {
    return buffer.readUInt8(0);
  } else if (sizeInBytes === 2) {
    return buffer.readUInt16BE(0);
  } else {
    throw `Unhandled sizeInBytes: ${sizeInBytes}`;
  }
}
