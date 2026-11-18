Your magnet-based downloader can retrieve one file piece. In this stage, you'll
download every piece, verify the data and save the complete file.

### The magnet download command

`magnet_download` takes a magnet link and an output path:

```bash
$ ./your_program.sh magnet_download -o /tmp/sample <magnet-link>
```

Use the verified metadata to download all file pieces. Check each piece against
its hash, then assemble them in piece-index order. The final file must contain
exactly the number of bytes declared by `length`, including the shorter final
piece.

This reuses the complete-file assembly behavior from `download`. The change is
how your client obtains the info dictionary before transferring file data.

### Tests

The tester executes:

```
$ ./your_program.sh magnet_download -o /tmp/sample <magnet-link>
```

It checks the saved file's length and SHA-1 hash. Exit with code `0` after
saving the complete file to the `-o` path.

### Notes

- You can use the
  [sample magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt)
  to test your program locally.
- Pipelining block requests is optional. Keeping several requests in flight can
  avoid waiting for a round trip between blocks. The
  [BitTorrent economics paper](http://bittorrent.org/bittorrentecon.pdf)
  discusses this technique.
