namespace App;

using static System.Text.Encoding;

public record Schema(
    string Type,
    string Name,
    string TableName,
    byte RootPage,
    string Sql)
{
    /// <summary>Parses a record into a schema</summary>
    public static Schema Parse(Record record)
    {
        var type = UTF8.GetString(record.Columns[0].Span);
        var name = UTF8.GetString(record.Columns[1].Span);
        var tableName = UTF8.GetString(record.Columns[2].Span);
        var rootPage = record.Columns[3].Span[0];
        var sql = UTF8.GetString(record.Columns[4].Span);

        return new(type, name, tableName, rootPage, sql);
    }
}
