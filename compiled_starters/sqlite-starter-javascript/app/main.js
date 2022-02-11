import DatabaseFile from "./database-file.js";
import readInt from "./read-int.js";
import readPageHeader from "./read-page-header.js";
import readRecord from "./read-record.js";
import readVarint from "./read-varint.js";

const databaseFilePath = process.argv[2];
const command = process.argv[3];

if (command === ".dbinfo") {
  const databaseFile = new DatabaseFile(databaseFilePath);

  await databaseFile.open();
  await databaseFile.seek(100); // Skip database header

  const pageHeader = await readPageHeader(databaseFile);

  const cellPointers = [];

  for (let i = 0; i < pageHeader.numberOfCells; i++) {
    cellPointers.push(await readInt(databaseFile, 2));
  }

  const sqliteSchemaRows = [];

  // Each of these cells represents a row in the sqlite_schema table.
  for (const cellPointer of cellPointers) {
    await databaseFile.seek(cellPointer);

    await readVarint(databaseFile); // Number of bytes in payload
    await readVarint(databaseFile); // Rowid

    const record = await readRecord(databaseFile, 5);

    // Table contains columns: type, name, tbl_name, rootpage, sql
    sqliteSchemaRows.push({
      type: record[0],
      name: record[1],
      tbl_name: record[2],
      rootpage: record[3],
      sql: record[4],
    });
  }

  // You can use print statements as follows for debugging, they'll be visible when running tests.
  console.log("Logs from your program will appear here!");

  // Uncomment this to pass the first stage
  // console.log(`number of tables: ${sqliteSchemaRows.length}`);
} else {
  throw `Unknown command ${command}`;
}
