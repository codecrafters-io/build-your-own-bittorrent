In this stage, you’ll download the entire file and save it to disk.

You can start with using a single peer to download all the pieces. You’ll need to download all the pieces, verify their integrity using piece hashes, and combine them to assemble the file.

### Tests

Here’s how the tester will execute your program:

```
$ ./your_program.sh download -o /tmp/test.txt sample.torrent
```

The tester will validate that the file was downloaded correctly.

**Optional:** To improve download speeds, you can download from multiple peers at once. You could have a work queue consisting of each piece that needs to be downloaded. Your worker (connection with a peer) could pick a piece from the work queue, attempt to download it, check the integrity, and write the downloaded piece into a buffer. Any failure (network issue, hashes not matching, peer not having the piece etc.) would put the piece back into the work queue to be tried again.