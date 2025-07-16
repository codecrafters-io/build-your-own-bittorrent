Welcome to the BitTorrent Magnet Links extension! In this extension, you'll add support for downloading files using magnet links.

In this stage, you will parse a magnet link and print out the info hash and tracker URL.

### Magnet links

[Magnet links](https://www.bittorrent.org/beps/bep_0009.html) allow users to download files from peers without needing a torrent file.

For example, here's a magnet link:
```
magnet:?xt=urn:btih:ad42ce8109f54c99613ce38f9b4d87e70f24a165&dn=magnet1.gif&tr=http%3A%2F%2Fbittorrent-test-tracker.codecrafters.io%2Fannounce
```

Unlike .torrent files, magnet links don't contain information like file length, piece length and piece hashes. They only include the bare minimum
information necessary to discover peers. A client can then request the rest of the information from peers using the [metadata exchange protocol](https://www.bittorrent.org/beps/bep_0009.html#metadata-exchange). You'll implement this in later stages.

These are the query parameters in a magnet link:

- `xt`: `urn:btih:` followed by the 40-char hex-encoded info hash (example: `urn:btih:ad42ce8109f54c99613ce38f9b4d87e70f24a165`)
- `dn`: The name of the file to be downloaded (example: `magnet1.gif`)
- `tr`: The tracker URL (example: `http://bittorrent-test-tracker.codecrafters.io/announce`)

[This Wikipedia article](https://en.wikipedia.org/wiki/Magnet_URI_scheme) has more information about the magnet link format.

### Magnet link example

Here's how the tester will execute your program:

```bash
$ ./your_program.sh magnet_parse <magnet-link>
```

The expected output should look like this:

```bash
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Info Hash: d69f91e6b2ae4c542468d1073a71d4ea13879a7f
```

### Notes

- We'll be using v1 of [magnet URI format](https://www.bittorrent.org/beps/bep_0009.html#magnet-uri-format). v2 is not widely used yet.
- `xt` (info hash) is the only required parameter, all others are optional.
- A magnet link can contain multiple tracker URLs, but for the purposes of this challenge it'll only contain one.