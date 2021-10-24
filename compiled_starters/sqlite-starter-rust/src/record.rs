use crate::varint::parse_varint;
use anyhow::{bail, Result};

/// Reads SQLite's "Record Format" as mentioned here:
/// [record_format](https://www.sqlite.org/fileformat.html#record_format)
pub fn parse_record(stream: &[u8], column_count: usize) -> Result<Vec<Vec<u8>>> {
    // Parse number of bytes in header, and use bytes_read as offset
    let (_, mut offset) = parse_varint(stream);

    // Read each varint into serial types and modify the offset
    let mut serial_types = vec![];
    for _ in 0..column_count {
        let (varint, read_bytes) = parse_varint(&stream[offset..]);
        offset += read_bytes;
        serial_types.push(varint);
    }

    // Parse each serial type as column into record and modify the offset
    let mut record = vec![];
    for serial_type in serial_types {
        let column = parse_column_value(&stream[offset..], serial_type as usize)?;
        offset += column.len();
        record.push(column);
    }

    Ok(record)
}

fn parse_column_value(stream: &[u8], serial_type: usize) -> Result<Vec<u8>> {
    let column_value = match serial_type {
        // 8 bit twos-complement integer
        1 => vec![stream[0]],
        // Text encoding
        n if serial_type >= 13 && serial_type % 2 == 1 => {
            let n_bytes = (n - 13) / 2;
            let bytes = stream[0..n_bytes as usize].to_vec();
            bytes
        }
        _ => bail!("Invalid serial_type: {}", serial_type),
    };
    Ok(column_value)
}
