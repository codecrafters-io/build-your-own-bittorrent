import json
import sys

# import pyparsing - available if you need it!
# import lark - available if you need it!

# Examples:
# 
# - decode_bencode("5:hello") -> "hello"
# - decode_bencode("10:hello12345") -> "hello12345"
def decode_bencode(bencoded_value):
    if bencoded_value[0].isdigit():
        length = int(bencoded_value.split(':')[0])
        return bencoded_value.split(':')[1][:length]
    else:
        raise NotImplementedError("Only strings are supported at the moment")


def main():
    command = sys.argv[1]

    if command == "decode":
        bencoded_value = sys.argv[2]

        print(json.dumps(decode_bencode(bencoded_value)))
    else:
        raise NotImplementedError(f"Unknown command {command}")


if __name__ == "__main__":
    main()
