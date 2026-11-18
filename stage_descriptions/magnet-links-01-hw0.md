The Magnet Links extension lets your existing downloader start without a
`.torrent` file by retrieving metadata from peers. In this stage, you'll parse a
magnet link to obtain its info hash and tracker URL.

### Magnet links

[Magnet links](https://www.bittorrent.org/beps/bep_0009.html) identify a torrent
without carrying its full metadata. For example:

```
magnet:?xt=urn:btih:ad42ce8109f54c99613ce38f9b4d87e70f24a165&dn=magnet1.gif&tr=http%3A%2F%2Fbittorrent-test-tracker.codecrafters.io%2Fannounce
```

The link has enough information to discover peers. It lacks the file length,
piece length and piece hashes needed by your downloader. Later stages retrieve
those fields from peers using the
[metadata exchange protocol](https://www.bittorrent.org/beps/bep_0009.html#metadata-exchange).

These query parameters supply the information used here:

- `xt`: `urn:btih:` followed by a 40-character hexadecimal info hash. In the
  example, the hash is `ad42ce8109f54c99613ce38f9b4d87e70f24a165`.
- `dn`: A suggested display name, such as `magnet1.gif`. It is not needed to
  identify the torrent.
- `tr`: A percent-encoded tracker URL. Decode
  `http%3A%2F%2Fbittorrent-test-tracker.codecrafters.io%2Fannounce` to
  `http://bittorrent-test-tracker.codecrafters.io/announce` before printing or
  using it.

The [magnet URI scheme](https://en.wikipedia.org/wiki/Magnet_URI_scheme)
describes other parameters.

### Tests

The tester runs `magnet_parse` with a magnet link. For the link above:

```bash
$ ./your_program.sh magnet_parse "magnet:?xt=urn:btih:ad42ce8109f54c99613ce38f9b4d87e70f24a165&dn=magnet1.gif&tr=http%3A%2F%2Fbittorrent-test-tracker.codecrafters.io%2Fannounce"
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Info Hash: ad42ce8109f54c99613ce38f9b4d87e70f24a165
```

Print the values from the supplied link with these labels. Quote magnet links
when testing in a shell so characters such as `&` remain part of the argument.

### Notes

- This extension uses the
  [v1 magnet URI format](https://www.bittorrent.org/beps/bep_0009.html#magnet-uri-format)
  with hexadecimal info hashes. You don't need v2 support.
- In the general format, `xt` is required and the other parameters are optional.
  The links used here include one tracker URL, so you can reuse your
  tracker-based peer discovery.
