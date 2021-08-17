import { Buffer } from "buffer";
import { open } from "fs/promises";

// A wrapper around fs.fileHandler that allows updating current position via seek().
export default class DatabaseFile {
  constructor(path) {
    this.path = path;
  }

  async open() {
    this.fileHandler = await open(this.path, "r");
    this.currentPosition = 0;
  }

  async read(numberOfBytes) {
    const { buffer } = await this.fileHandler.read({
      length: numberOfBytes,
      position: this.currentPosition,
      buffer: Buffer.alloc(numberOfBytes),
    });

    this.currentPosition += numberOfBytes;

    return buffer;
  }

  async seek(position) {
    this.currentPosition = position;
  }
}
