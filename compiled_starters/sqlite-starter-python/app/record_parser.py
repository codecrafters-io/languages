from .varint_parser import parse_varint


def parse_column_value(stream, serial_type):
    if (serial_type >= 13) and (serial_type % 2 == 1):
        # Text encoding
        n_bytes = (serial_type - 13) // 2
        return stream.read(n_bytes)
    elif serial_type == 1:
        # 8 bit twos-complement integer
        return int.from_bytes(stream.read(1), "big")
    else:
        raise Exception(f"Unhandled serial_type {serial_type}")


def parse_record(stream, column_count):
    _number_of_bytes_in_header = parse_varint(stream)

    serial_types = [parse_varint(stream) for i in range(column_count)]
    return [parse_column_value(stream, serial_type) for serial_type in serial_types]
