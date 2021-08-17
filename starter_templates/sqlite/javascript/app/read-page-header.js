import readInt from "./read-int.js";

// Reads a page header as mentioned here: https://www.sqlite.org/fileformat2.html#b_tree_pages
export default async function readPageHeader(databaseFile) {
  const pageType = await readInt(databaseFile, 1);
  const firstFreeBlockStart = await readInt(databaseFile, 2);
  const numberOfCells = await readInt(databaseFile, 2);
  const startOfContentArea = await readInt(databaseFile, 2);
  const fragmentedFreeBytes = await readInt(databaseFile, 1);

  // This starter code assumes that the page is a leaf page, and hence 8 bytes in size.
  // When you get to reading interior pages you'll need to change this to handle 12 byte headers too.

  return {
    pageType,
    firstFreeBlockStart,
    numberOfCells,
    startOfContentArea,
    fragmentedFreeBytes,
  };
}
