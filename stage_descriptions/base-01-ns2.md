BitTorrent uses Bencode to store the metadata a client needs before downloading
a file. In this stage, you'll decode a Bencoded string and print its value as
JSON.

### Bencoded strings

Bencode is a serialization format: it represents values as bytes that can be
stored or sent to another program. A byte string is encoded as
`<length>:<contents>`. The length is written in decimal and counts the bytes
after the colon. It does not include the digits or the colon itself.

For example, `5:hello` represents the five bytes in `hello`, and `0:` represents
an empty byte string. Bencoded strings can contain arbitrary bytes. The `decode`
examples in this stage contain text, so show the decoded value as a JSON string,
including its double quotes.

### Tests

The tester passes the command and Bencoded input as arguments:

```sh
$ ./your_program.sh decode 5:hello
"hello"
```

Write the JSON result followed by a newline to stdout and exit with code `0`.
The input string varies. Support for the other Bencode types comes in later
stages.

### Notes

- Send debugging messages to stderr so they don't become part of the JSON
  result.
