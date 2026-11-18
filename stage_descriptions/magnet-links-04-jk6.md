Each peer chooses the extension IDs it accepts. In this stage, you'll read the
remote peer's extension handshake and print its metadata extension ID.

### Reading the peer's mapping

The remote peer's extension handshake uses the same framing as yours: outer
BitTorrent message ID `20`, extension ID `0`, then a Bencoded dictionary. Its
`m` dictionary contains `{"ut_metadata": <PEER'S ID>}`.

Keep the two directions separate. The ID you advertised tells the peer which ID
to use for messages sent to you. The ID in the peer's handshake tells you which
ID to use for messages sent to that peer. For example, you might advertise `16`
while the peer advertises `123`.

Continue the exchange you already perform: ordinary handshake, received
bitfield, then extension handshake when the peer supports extensions. This stage
adds reading the peer's mapping. Use its `ut_metadata` value rather than
assuming it matches yours.

### Tests

The tester executes:

```bash
$ ./your_program.sh magnet_handshake <magnet-link>
```

The expected output has this form:

```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
Peer Metadata Extension ID: 123
```

Both values come from the peer. Its metadata extension ID is chosen randomly for
the test, so `123` is only an example.

### Notes

- You can use the
  [sample magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt)
  locally. Quote the link when passing it to your shell.
- Keep extension IDs per peer. Different peers can use different IDs for the
  same extension.
