IS_FIRST_BIT_ZERO_MASK = 0b10000000
LAST_SEVEN_BITS_MASK = 0b01111111


def parse_varint(stream):
    usable_bytes = read_usable_bytes(stream)

    value = 0

    for index, usable_byte in enumerate(usable_bytes):
        # For all bytes except the 9th one, the first bit is ignored
        usable_size = 8 if index == 8 else 7

        shifted = value << usable_size
        value = shifted + usable_value(usable_size, usable_byte)

    return value


def usable_value(usable_size, byte):
    """Usable_size is either 8 or 7."""
    return byte if usable_size == 8 else  byte & LAST_SEVEN_BITS_MASK


def read_usable_bytes(stream):
    usable_bytes = []

    for i in range(8):
        byte = int.from_bytes(stream.read(1), "big")
        usable_bytes.append(byte)

        if starts_with_zero(byte):
            break

    return usable_bytes


def starts_with_zero(byte):
    return (byte & IS_FIRST_BIT_ZERO_MASK) == 0
