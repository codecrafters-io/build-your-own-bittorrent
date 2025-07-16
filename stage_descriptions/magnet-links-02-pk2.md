In this stage, you'll modify the handshake message to indicate that your client supports extensions.

### Extension handshake

Exchanging torrent metadata between peers wasn't originally part of the standard BitTorrent protocol, it was introduced as
an [extension](https://www.bittorrent.org/beps/bep_0009.html). This extension uses BitTorrent's [extension protocol](https://www.bittorrent.org/beps/bep_0010.html) that is designed to add
functionality without breaking backward-compatibility.

During the "Peer handshake" stage, the handshake message includes eight reserved bytes (64 bits), all set to zero. To signal
support for extensions, a client must set the 20th bit from the right (counting starts at 0) in the reserved bytes to 1.

In Hex, here's how the reserved bytes will look like after setting the 20th bit from the right to 1:

```bash
00 00 00 00 00 10 00 00
```

(`10` in hex is `16` in decimal, which is `00010000` in binary)

When looking at individual bits, here's how it'll look like (left side truncated):

```bash
.... 00010000 00000000 00000000
        ^ 20th bit from the right, counting starts at 0
```

All the other reserved bits will stay zero.

### The `magnet_handshake` command

To test your program, we'll introduce a new command in this stage: `magnet_handshake`. Here's how it works:

```bash
$ ./your_program.sh magnet_handshake <magnet-link>
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
```

Your program will need to:

- Parse the magnet link to get the tracker URL
- Perform the tracker GET request to get a list of peers
- Establish a TCP connection with a peer, and perform a handshake
  - In this handshake, your program will need to set the correct reserved bit to indicate support for extensions
- Print the peer ID received during the handshake

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh magnet_handshake <magnet-link>
```

The expected output should look like this:

```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
```

Tester will also assert that correct bit is set in the reserved bytes of the handshake message.

### Notes

- You can use [these magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt) to test your program locally. You may need to surround links with double quotes to escape special characters in terminal.