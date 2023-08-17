import json
import sys

# import pyparsing - available if you need it!
# import lark - available if you need it!

def decode_bencode(bencoded_string):
    if bencoded_string[0] == "s":
        length, remaining_contents = bencoded_string.split(":", 1)
        return remaining_contents[:int(length)]
    else:
        raise NotImplementedError("Only strings are supported at the moment")


def main():
    bencoded_string = sys.argv[1]

    # You can use print statements as follows for debugging, they'll be visible when running tests.
    print("Logs from your program will appear here!")

    # Uncomment this block to pass the first stage
    # print(json.dumps(decode_bencode(bencoded_string))


if __name__ == "__main__":
    main()
