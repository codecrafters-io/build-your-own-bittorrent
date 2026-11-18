You can now obtain the same info dictionary from a peer that you previously read
from a torrent file. In this stage, you'll use a magnet link to download and
save one file piece.

### Downloading a file piece

The `magnet_download_piece` command takes a magnet link in place of the
torrent-file argument to `download_piece`:

```bash
$ ./your_program.sh magnet_download_piece -o /tmp/test-piece-0 <magnet-link> 0
```

Obtain and verify the info dictionary using your existing tracker discovery,
peer handshake and metadata exchange. Its `piece length`, `length` and `pieces`
fields supply the same information your file-piece downloader previously read
from disk.

The final argument selects a file piece. It is separate from the metadata piece
index: metadata piece `0` contains the info dictionary, while file piece `0`
contains the beginning of the file.

Reuse your `interested`/`unchoke` exchange, file-block requests and piece-hash
checks. Preserve the shorter-final-piece behavior and write only the requested
piece's raw bytes to the `-o` path.

### Tests

The tester executes:

```
$ ./your_program.sh magnet_download_piece -o /tmp/test-piece-0 <magnet_link> 0
```

It checks the saved piece's length and SHA-1 hash. Exit with code `0` after the
correct piece has been saved.

### Notes

- You can use the
  [sample magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt)
  to test your program locally.
