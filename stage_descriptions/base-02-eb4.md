Your `decode` command reads byte strings. Bencode also represents numbers such
as a file's length. In this stage, you'll add support for Bencoded integers.

### Bencode

[Bencode](https://en.wikipedia.org/wiki/Bencode) (pronounced _Bee-encode_) is a
serialization format used in
[the BitTorrent protocol](https://www.bittorrent.org/beps/bep_0003.html). It is
used in torrent files and in communication between trackers and peers.

Bencode supports four data types:

- strings
- integers
- lists
- dictionaries

### Bencoded integers

Integers are encoded as `i<number>e`. For example:

- `52` is encoded as `i52e`
- `-52` is encoded as `i-52e`

The `i` and `e` delimit an integer. They are not part of the number. Unlike the
string length prefix, the number between them is the value itself. Print it as a
JSON number without quotes. Values can be negative or larger than a 32-bit
integer, such as `4294967300`.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh decode i52e
52
```

{{#lang_is_go}}

### Notes

If you'd prefer to use a library for this stage,
[bencode-go](https://github.com/jackpal/bencode-go) is available for you to use.
{{/lang_is_go}} {{#lang_is_python}}

### Notes

If you'd prefer to use a library for this stage,
[bencode.py](https://pypi.org/project/bencode.py/) is available for you to use.
{{/lang_is_python}} {{#lang_is_rust}}

### Notes

If you'd prefer to use a library crate for this stage,
[serde-bencode](https://github.com/toby/serde-bencode/) is available for you to
use. {{/lang_is_rust}} {{#lang_is_java}}

### Notes

If you'd prefer to use a library for this stage,
[bencode](https://github.com/dampcake/bencode) parser is available for you to
use. {{/lang_is_java}} {{#lang_is_kotlin}}

### Notes

If you'd prefer to use a library for this stage,
[bencode](https://github.com/dampcake/bencode) parser is available for you to
use. {{/lang_is_kotlin}}
