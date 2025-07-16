[Bencode](https://en.wikipedia.org/wiki/Bencode) (pronounced *Bee-encode*) is a serialization format used in [the BitTorrent protocol](https://www.bittorrent.org/beps/bep_0003.html). It is used in torrent files and in communication between trackers and peers.

Bencode supports four data types:
- strings
- integers
- arrays
- dictionaries

In this stage, we'll focus on decoding strings.

Strings are encoded as `<length>:<contents>`. For example, the string `"hello"` is encoded as `"5:hello"`.

You'll implement a `decode` command which takes a bencoded value as input and prints the decoded value as JSON.

Here’s how the tester will execute your program:

```
$ ./your_program.sh decode 5:hello
"hello"
```