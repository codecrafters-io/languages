namespace codecrafters_sqlite;

public static class Varint
{
    /// <summary>
    /// Parses SQLite's "varint" (short for variable-length integer) as mentioned here:
    /// https://www.sqlite.org/fileformat2.html#varint
    /// </summary>
    public static (long Value, byte Len) Parse(ReadOnlyMemory<byte> stream) => stream
        .ReadUsableBytes()
        .Select((b, i) => i switch
        {
            8 => (usedBits: 8, value: b),
            _ => (usedBits: 7, value: b.WithoutFirstBit())
        })
        .Aggregate(
            (value: 0L, len: (byte)0),
            (varint, b) =>
            {
                var value = varint.value << b.usedBits | b.value;
                return (value, ++varint.len);
            });

    private static IEnumerable<byte> ReadUsableBytes(this ReadOnlyMemory<byte> stream)
    {
        for (var i = 0; i < 9; i++)
        {
            var b = stream.Span[i];
            yield return b;

            if (b.IsFirstBitZero()) yield break;
        }
    }

    private static bool IsFirstBitZero(this byte b) => (b & 0b1000_0000) == 0;

    private static byte WithoutFirstBit(this byte b) => (byte)(b & 0b0111_1111);
}
