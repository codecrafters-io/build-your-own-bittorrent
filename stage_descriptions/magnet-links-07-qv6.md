In this stage, you'll download one piece and save it to disk using a magnet link.

### The `magnet_download_piece` command

To test your program, we'll introduce a new command in this stage: `magnet_download_piece`. Here's how it works:

```bash
$ ./your_program.sh magnet_download_piece -o /tmp/test-piece-0 <magnet-link> 0
```

This is similar to the `download_piece` command you've worked on previously, just that it takes a magnet link instead of a .torrent file path.

For this command, the overall flow you need to implement will look like this:

- Parse magnet link to get the tracker URL
- Perform the tracker GET request to get the list of peers
- Establish a TCP connection with a peer, perform a base handshake
- Perform the extension handshake
- Get the info dictionary using the metadata extension (send `request` message, get `data` message)
- Download blocks of the piece (same as the `download_piece` command from previous stages)
- Save the piece to disk

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh magnet_download_piece -o /tmp/test-piece-0 <magnet_link> 0
```

The tester will validate that the piece was downloaded correctly.

### Notes

- To test your program locally, you can use [these magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt)