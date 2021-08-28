#[derive(Debug)]
pub struct Schema {
    kind: String,
    name: String,
    table_name: String,
    root_page: u8,
    sql: String,
}

impl Schema {
    /// Parses a record into a schema
    pub fn parse(record: Vec<Vec<u8>>) -> Option<Self> {
        let mut items = record.into_iter();
        let kind = items.next()?;
        let name = items.next()?;
        let table_name = items.next()?;
        let root_page = *items.next()?.get(0)?;
        let sql = items.next()?;

        let schema = Self {
            kind: String::from_utf8_lossy(&kind).to_string(),
            name: String::from_utf8_lossy(&name).to_string(),
            table_name: String::from_utf8_lossy(&table_name).to_string(),
            root_page,
            sql: String::from_utf8_lossy(&sql).to_string(),
        };
        Some(schema)
    }
}
