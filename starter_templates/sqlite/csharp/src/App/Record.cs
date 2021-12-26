namespace App;

public record Record(ReadOnlyMemory<byte>[] Columns)
{
    /// <summary>
    /// Reads SQLite's "Record Format" as mentioned here:
    /// https://www.sqlite.org/fileformat.html#record_format
    /// </summary>
    public static Record Parse(ReadOnlyMemory<byte> stream) => new(ParseColumns(stream).ToArray());

    private static IEnumerable<ReadOnlyMemory<byte>> ParseColumns(ReadOnlyMemory<byte> stream)
    {
        var (headerSize, headerOffset) = Varint.Parse(stream);
        var contentOffset = (int)headerSize;

        while (headerOffset < headerSize)
        {
            var (serialType, bytesRead) = Varint.Parse(stream[headerOffset..]);
            var column = ParseColumnValue((int)serialType, stream[contentOffset..]);

            yield return column;

            headerOffset += bytesRead;
            contentOffset += column.Length;
        }
    }

    private static ReadOnlyMemory<byte> ParseColumnValue(int serialType, ReadOnlyMemory<byte> stream)
        => serialType switch
        {
            // 8 bit twos-complement integer
            1 => stream[0..1],
            // Text encoding
            var t when IsText(t) => stream[..GetTextLen(t)],
            var t => throw new NotSupportedException($"Invalid serial type: {t}")
        };

    private static bool IsText(int serialType) => serialType >= 13 && serialType % 2 == 1;

    private static int GetTextLen(int serialType) => (serialType - 13) / 2;
}
