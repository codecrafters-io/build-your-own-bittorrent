In this stage, you'll download an entire file and save it to disk using a magnet link.

### The `magnet_download` command

To test your program, we'll introduce a new command in this stage: `magnet_download`. Here's how it works:

```bash
$ ./your_program.sh magnet_download -o /tmp/sample <magnet-link>
```

This is similar to the `magnet_download_piece` command from the previous stage, just that it downloads the entire file instead of a single piece. You'll
need to download all the pieces and then concatenate them in order to get the complete file.

### Tests

Here's how the tester will execute your program:
```
$ ./your_program.sh magnet_download -o /tmp/sample <magnet-link>
```

The tester will validate that the file was downloaded correctly.

### Notes

- To test your program locally, you can use [these magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt)
- To improve download speeds, you can consider pipelining your requests. [BitTorrent Economics Paper](http://bittorrent.org/bittorrentecon.pdf) recommends having upto 5 requests pending at once to avoid a delay between blocks being sent.