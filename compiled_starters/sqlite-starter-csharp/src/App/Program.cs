using App;
using static System.Buffers.Binary.BinaryPrimitives;

// Parse arguments
var (path, command) = args.Length switch
{
    0 => throw new InvalidOperationException("Missing <database path> and <command>"),
    1 => throw new InvalidOperationException("Missing <command>"),
    _ => (args[0], args[1])
};

// Read database file into database
var database = File.ReadAllBytes(path).AsMemory();

// Parse command and act accordingly
if (command == ".dbinfo")
{
    // Parse page header from database
    var pageheader = PageHeader.Parse(database[100..108]);

    // Obtain all cell pointers
    var cellPointers = database[108..]
        .Chunk(2)
        .Take(pageheader.NumberOfCells)
        .Select(bytes => ReadUInt16BigEndian(bytes.Span));

    // Obtain all schema records
    var schemas = cellPointers
        .Select(cellPointer =>
        {
            var stream = database[cellPointer..];

            var (_payloadSize, bytesRead1) = Varint.Parse(stream);
            var (_rowId, bytesRead2) = Varint.Parse(stream[bytesRead1..]);

            var record = Record.Parse(stream[(bytesRead1 + bytesRead2)..]);
            return Schema.Parse(record);
        })
        .ToArray();

    Console.WriteLine("Logs from your program will appear here!");

    // Uncomment this line to pass the first stage
    // Console.WriteLine($"number of tables: {schemas.Length}");
}
else
{
    throw new InvalidOperationException($"Invalid command: {command}");
}
