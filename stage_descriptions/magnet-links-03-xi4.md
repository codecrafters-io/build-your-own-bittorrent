The reserved handshake bit announces support for extension messages, but does
not name any particular extension. In this stage, you'll send an extension
handshake advertising `ut_metadata`.

### Extension names and IDs

Each peer advertises a mapping from extension names to the numeric IDs it
accepts. The
[metadata extension](https://www.bittorrent.org/beps/bep_0009.html#ut_metadata)
is named `ut_metadata`. Different peers can assign it different IDs.

An
[extension handshake](https://www.bittorrent.org/beps/bep_0010.html#handshake-message)
carries this mapping under a dictionary key named `m`. For example, your client
could advertise:

```json
{
  "m": {
    "ut_metadata": 16
  }
}
```

This is JSON notation for readability. Encode the dictionary as Bencode on the
wire. Choose a `ut_metadata` ID from `1` to `255`. It tells the remote peer
which ID to use when sending metadata messages to your client. The challenge
uses one mapping for the connection.

Other extensions can appear in the mapping. For example,
`{"ut_metadata": 1, "ut_pex": 2}` advertises two extensions. You only need to
advertise `ut_metadata` here.

### Sending the extension handshake

After the ordinary peer handshake, receive the peer's bitfield message. You
don't need to send your own bitfield in this challenge. If the peer's reserved
bit indicates extension support, send an extension handshake with these fields:

| Field                 | Size     | Value                                                 |
| --------------------- | -------- | ----------------------------------------------------- |
| Message length        | 4 bytes  | Big-endian byte count of the IDs and dictionary below |
| BitTorrent message ID | 1 byte   | `20` for extension messages                           |
| Extension message ID  | 1 byte   | `0` for the extension handshake                       |
| Dictionary            | Variable | Bencoded `m` mapping                                  |

The length excludes its own four bytes. The handshake's extension ID `0` is
distinct from the nonzero ID you choose for `ut_metadata`.

Only send this message if the remote peer supports the extension protocol.
Reading its extension handshake and learning its chosen metadata ID comes in
later stages.

### Tests

The tester executes:

```
$ ./your_program.sh magnet_handshake <magnet-link>
```

Keep printing the received peer ID:

```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
```

The value varies. The tester also verifies that your extension handshake
contains `{"m": {"ut_metadata": <PICK YOUR ID>}}`, with the chosen ID between
`1` and `255`.

### Notes

- The
  [extension handshake specification](https://www.bittorrent.org/beps/bep_0010.html#handshake-message)
  defines additional optional fields. The `m` mapping is enough here.
