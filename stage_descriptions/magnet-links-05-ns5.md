Your client knows the remote peer's metadata extension ID. In this stage, you'll
add `magnet_info` and send a request for metadata piece `0`.

### Requesting metadata

The
[metadata extension](https://www.bittorrent.org/beps/bep_0009.html#extension-message)
transfers the Bencoded `info` dictionary that your downloader needs. It defines
three message types:

- `request` (`msg_type: 0`): Requests a piece of metadata.
- `data` (`msg_type: 1`): Returns a piece of metadata.
- `reject` (`msg_type: 2`): Reports that the requested metadata piece is
  unavailable.

A metadata piece is a chunk of at most 16 KiB (`16384` bytes). These chunks are
separate from the file pieces described inside the info dictionary. The
challenge's metadata fits in one chunk, so request metadata piece `0`.

### The metadata request message

Keep three identifiers distinct: outer BitTorrent message ID `20` selects the
extension protocol, the peer's advertised extension ID selects `ut_metadata`,
and `msg_type` `0` selects a metadata request. This is different from the
file-block request with ID `6` in the
[BitTorrent peer protocol](https://www.bittorrent.org/beps/bep_0003.html).

Send these fields:

| Field                 | Size     | Value                                                 |
| --------------------- | -------- | ----------------------------------------------------- |
| Message length        | 4 bytes  | Big-endian byte count of the IDs and dictionary below |
| BitTorrent message ID | 1 byte   | `20`                                                  |
| Extension message ID  | 1 byte   | The remote peer's advertised `ut_metadata` ID         |
| Request dictionary    | Variable | `{"msg_type": 0, "piece": 0}`, encoded as Bencode     |

The length excludes its own four bytes. Use the ID you received in the peer's
handshake, even when your own advertised ID differs.

### Tests

The tester executes:

```bash
$ ./your_program.sh magnet_info <magnet-link>
```

Reuse tracker discovery and the peer and extension handshakes, then send the
metadata request. The tester checks that it receives a correctly framed request
for piece `0` and that your program exits with code `0`. No stdout output is
required in this stage. Receiving metadata and printing its fields come in later
stages.
