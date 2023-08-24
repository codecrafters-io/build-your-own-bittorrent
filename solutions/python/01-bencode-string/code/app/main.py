import json
import sys

# import pyparsing - available if you need it!
# import lark - available if you need it!

# Examples:
# 
# - decode_bencode("5:hello") -> "hello"
# - decode_bencode("10:hello12345") -> "hello12345"
def decode_bencode(bencoded_value):
    if chr(bencoded_value[0]).isdigit():
        length = int(bencoded_value.split(b":")[0])
        return bencoded_value.split(b":")[1][:length]
    else:
        raise NotImplementedError("Only strings are supported at the moment")


def main():
    command = sys.argv[1]

    if command == "decode":
        bencoded_value = sys.argv[2].encode()

        # json.dumps() can't handle bytes, but bencoded "strings" need to be
        # bytestrings since they might contain non utf-8 characters.
        #
        # Let's convert them to strings for printing to the console.
        def bytes_to_str(data):
            if isinstance(data, bytes):
                return data.decode()

            raise TypeError(f"Type not serializable: {type(data)}")

        print(json.dumps(decode_bencode(bencoded_value), default=bytes_to_str))
    else:
        raise NotImplementedError(f"Unknown command {command}")


if __name__ == "__main__":
    main()
