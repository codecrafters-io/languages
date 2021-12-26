namespace App;

using static System.Buffers.Binary.BinaryPrimitives;

public enum BTreePage
{
    InteriorIndex = 2,
    InteriorTable = 5,
    LeafIndex = 10,
    LeafTable = 13,
}

public record PageHeader(
    BTreePage PageType,
    ushort FirstFreeBlockStart,
    ushort NumberOfCells,
    ushort StartOfContentArea,
    byte FragmentedFreeBytes)
{
    public static PageHeader Parse(ReadOnlyMemory<byte> stream)
    {
        var bytes = stream.Span;
        var pageType = bytes[0] switch
        {
            2 => BTreePage.InteriorIndex,
            5 => BTreePage.InteriorTable,
            10 => BTreePage.LeafIndex,
            13 => BTreePage.LeafTable,
            var x => throw new InvalidOperationException($"Invalid page value encountered: {x}")
        };
        var firstFreeBlockStart = ReadUInt16BigEndian(bytes[1..3]);
        var numberOfCells = ReadUInt16BigEndian(bytes[3..5]);
        var startOfContentArea = ReadUInt16BigEndian(bytes[5..7]);
        var fragmentedFreeBytes = bytes[7];

        return new(pageType, firstFreeBlockStart, numberOfCells, startOfContentArea, fragmentedFreeBytes);
    }
}
