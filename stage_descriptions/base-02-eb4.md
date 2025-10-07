In this stage, you'll extend the `decode` command to support bencoded integers.

### Bencode

[Bencode](https://en.wikipedia.org/wiki/Bencode) (pronounced _Bee-encode_) is a serialization format used in [the BitTorrent protocol](https://www.bittorrent.org/beps/bep_0003.html). It is used in torrent files and in communication between trackers and peers.

Bencode supports four data types:

- strings
- integers
- arrays
- dictionaries

In this stage, we'll extend your `decode` command to support bencoded integers

### Bencoded integers

Integers are encoded as `i<number>e`. For example:

- `52` is encoded as `i52e`
- `-52` is encoded as `i-52e`

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh decode i52e
52
```

{{#lang_is_go}}
If you'd prefer to use a library for this stage, [bencode-go](https://github.com/jackpal/bencode-go) is available for you to use.
{{/lang_is_go}}
{{#lang_is_python}}
If you'd prefer to use a library for this stage, [bencode.py](https://pypi.org/project/bencode.py/) is available for you to use.
{{/lang_is_python}}
{{#lang_is_rust}}
If you'd prefer to use a library crate for this stage, [serde-bencode](https://github.com/toby/serde-bencode/) is available for you to use.
{{/lang_is_rust}}
{{#lang_is_java}}
If you'd prefer to use a library for this stage, [bencode](https://github.com/dampcake/bencode) parser is available for you to use.
{{/lang_is_java}}
{{#lang_is_kotlin}}
If you'd prefer to use a library for this stage, [bencode](https://github.com/dampcake/bencode) parser is available for you to use.
{{/lang_is_kotlin}}
