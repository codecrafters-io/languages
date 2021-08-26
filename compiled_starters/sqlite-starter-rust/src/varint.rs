const IS_FIRST_BIT_ZERO_MASK: u8 = 0b10000000;
const LAST_SEVEN_BITS_MASK: u8 = 0b01111111;

/// Parses SQLite's "varint" (short for variable-length integer) as mentioned here:
/// [varint](https://www.sqlite.org/fileformat2.html#varint)
///
/// Returns (varint, bytes_read)
pub fn parse_varint(stream: &[u8]) -> (usize, usize) {
    let usable_bytes = read_usable_bytes(stream);
    let bytes_read = usable_bytes.len();
    let varint = usable_bytes
        .into_iter()
        .enumerate()
        .fold(0, |value, (i, usable_byte)| {
            let usable_size = if i == 8 { 8 } else { 7 };
            (value << usable_size) + usable_value(usable_size, usable_byte) as usize
        });
    (varint, bytes_read)
}

/// Usable size is either 8 or 7
fn usable_value(usable_size: u8, byte: u8) -> u8 {
    if usable_size == 8 {
        usable_size
    } else {
        byte & LAST_SEVEN_BITS_MASK
    }
}

fn read_usable_bytes(stream: &[u8]) -> Vec<u8> {
    let mut usable_bytes = vec![];

    for i in 0..8 {
        let byte = stream[i];
        usable_bytes.push(byte);
        if starts_with_zero(byte) {
            break;
        }
    }

    usable_bytes
}

fn starts_with_zero(byte: u8) -> bool {
    (byte & IS_FIRST_BIT_ZERO_MASK) == 0
}
