namespace App;

public static class MemoryExtensions
{
    /// <summary>
    /// Splits a `System.Memory` into smaller chunks. Works like `IEnumerable.Chunk()`
    /// but doesn't allocate additional arrays.
    /// </summary>
    /// <seealso>https://docs.microsoft.com/dotnet/api/system.linq.enumerable.chunk</seealso>
    public static IEnumerable<Memory<T>> Chunk<T>(this Memory<T> source, int size)
    {
        for (int i = 0; i < source.Length; i += size)
        {
            yield return i + size < source.Length
                ? source.Slice(i, length: size)
                : source[i..];
        }
    }
}
