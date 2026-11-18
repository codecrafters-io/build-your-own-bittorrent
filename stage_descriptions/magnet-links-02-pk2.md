Your client can parse the information needed to find peers from a magnet link.
In this stage, you'll add `magnet_handshake` and advertise extension support in
its peer handshake.

### Finding peers without a file length

Reuse your tracker request, taking the tracker URL and info hash from the magnet
link. Decode the hexadecimal hash back to 20 bytes for the tracker query and
peer handshake.

Your tracker request also needs `left`, but the file length is still unknown.
For this challenge, use a nonzero placeholder such as `left=1` until you receive
the metadata. Keep the other query parameters from your existing tracker
request.

### Advertising extension support

Peer metadata exchange is a
[BitTorrent extension](https://www.bittorrent.org/beps/bep_0009.html). It uses
the [extension protocol](https://www.bittorrent.org/beps/bep_0010.html), which
lets peers announce additional capabilities.

The ordinary peer handshake has eight reserved bytes. Set the bit with mask
`0x10` in reserved byte `5`, counting bytes from zero. This is bit `20` counting
from the right, starting at zero. With the other bits clear, the bytes are:

```
00 00 00 00 00 10 00 00
```

The hexadecimal byte `10` is decimal `16`, or binary `00010000`:

```
.... 00010000 00000000 00000000
        ^ 20th bit from the right, counting starts at 0
```

This bit announces support for extension messages. The extension handshake that
names particular extensions comes in later stages. Your client still exchanges
the ordinary 68-byte peer handshake and prints the received peer ID.

### Tests

The tester executes:

```
$ ./your_program.sh magnet_handshake <magnet-link>
```

The expected output has this form:

```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
```

The peer ID varies. Print the 40-character hexadecimal form of the ID you
receive. The tester also checks that the extension-support bit is set in your
handshake.

### Notes

- You can use the
  [sample magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt)
  locally. Surround the link with quotes so the shell passes it as one argument.
