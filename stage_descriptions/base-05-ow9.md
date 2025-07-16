In this stage, you'll parse a torrent file and print information about the torrent.

A torrent file (also known as a [metainfo file](https://www.bittorrent.org/beps/bep_0003.html#metainfo-files)) contains a bencoded dictionary with the following keys and values:

- `announce`:
    - URL to a "tracker", which is a central server that keeps track of peers participating in the sharing of a torrent.
- `info`:
    - A dictionary with keys:
        - `length`: size of the file in bytes, for single-file torrents
        - `name`: suggested name to save the file / directory as
        - `piece length`: number of bytes in each piece
        - `pieces`: concatenated SHA-1 hashes of each piece

{{#lang_is_java}}
**Note**: .torrent files contain bytes that aren’t valid UTF-16 characters. You’ll run into problems if you try to read the contents of this file as a `String`. Use `byte[]` instead.
{{/lang_is_java}}
{{#lang_is_kotlin}}
**Note**: .torrent files contain bytes that aren’t valid UTF-16 characters. You’ll run into problems if you try to read the contents of this file as a `String`. Use `byte[]` instead.
{{/lang_is_kotlin}}
{{#lang_is_rust}}
**Note:** .torrent files contain bytes that aren’t valid UTF-8 characters. You'll run into problems if you try to read the contents of this file as a `String`. Use `&[u8]` or `Vec<u8>` instead.
{{/lang_is_rust}}
{{#lang_is_elixir}}
**Note:** .torrent files contain bytes that aren’t valid UTF-8 characters. You'll run into problems if you try to read the contents of this file as a `String`. Use `binary` instead, see `IO.iodata_to_binary()`.
{{/lang_is_elixir}}

{{^lang_is_java}}
{{^lang_is_kotlin}}
{{^lang_is_rust}}
{{^lang_is_elixir}}
**Note:** .torrent files contain bytes that aren’t valid UTF-8 characters. If the language you're using treats strings as a sequence of unicode characters (like Python's [str](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)), you'll need to use a byte sequence (like Python's [bytes](https://docs.python.org/3/library/stdtypes.html#bytes-objects)) instead.
{{/lang_is_elixir}}
{{/lang_is_rust}}
{{/lang_is_kotlin}}
{{/lang_is_java}}

**Note**: The `info` dictionary looks slightly different for multi-file torrents. For this challenge, we'll only implement support for single-file torrents.

In this stage, we'll focus on extracting the tracker URL and the length of the file (in bytes).

Here’s how the tester will execute your program:

```
$ ./your_program.sh info sample.torrent
```

The expected output should look like this:

```
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 92063
```