Your decoder can now read Bencode's value types. In this stage, you'll use it to
extract the tracker URL and file length from a `.torrent` file.

### Torrent metadata

A torrent file describes the file to download and how to find its data. It does
not contain the downloaded file's contents. A torrent file (also known as a
[metainfo file](https://www.bittorrent.org/beps/bep_0003.html#metainfo-files))
contains a bencoded dictionary with the following keys and values:

<!-- prettier-ignore -->
- `announce`:
    - URL to a tracker, a server that lists other clients sharing the torrent.
      These clients are called peers.
- `info`:
    - A dictionary describing the file and its pieces. A piece is a chunk of file
      data that can be downloaded and checked independently. Its fields include:
        - `length`: size of the file in bytes, for single-file torrents
        - `name`: suggested name to save the file / directory as
        - `piece length`: number of bytes in each piece
        - `pieces`: concatenated SHA-1 hashes of each piece, used to check
          downloaded data in later stages

Bencoded strings can hold raw hash bytes as well as text. Read the torrent as
bytes, and decode only text fields such as `announce` as text.

This challenge uses single-file torrents. Multi-file torrents use a different
layout inside `info` and are outside the scope here.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh info sample.torrent
```

The expected output should look like this:

```
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 92063
```

The tester uses different torrent files. Derive both values from the supplied
file, and retain the labels and the space after each colon.

### Notes

{{#lang_is_java}}

- Read `.torrent` files into `byte[]`. Binary hash values can be altered if you
  convert the entire file to a `String`. {{/lang_is_java}} {{#lang_is_kotlin}}
- Read `.torrent` files into a `ByteArray`. Binary hash values can be altered if
  you convert the entire file to a `String`. {{/lang_is_kotlin}}
  {{#lang_is_rust}}
- Read `.torrent` files as `&[u8]` or `Vec<u8>`. Binary hash values need not be
  valid UTF-8, so converting the whole file to a `String` can fail.
  {{/lang_is_rust}} {{#lang_is_elixir}}
- Keep `.torrent` contents in a `binary` and avoid UTF-8-specific string
  operations on hash bytes. `IO.iodata_to_binary()` can combine byte-oriented
  input. {{/lang_is_elixir}}

{{^lang_is_java}} {{^lang_is_kotlin}} {{^lang_is_rust}} {{^lang_is_elixir}}

- Read the file as a byte sequence so binary hash values survive unchanged. Keep
  the distinction between
  [bytes](https://docs.python.org/3/library/stdtypes.html#bytes-objects) and
  [Unicode text](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)
  when decoding individual values. {{/lang_is_elixir}} {{/lang_is_rust}}
  {{/lang_is_kotlin}} {{/lang_is_java}}
