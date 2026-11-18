Your client requests metadata from a peer. In this stage, you'll receive and
verify that metadata, then print the information needed to download the file.

### The metadata data message

A metadata `data` message responds to your metadata request. Its outer framing
is:

| Field                 | Size     | Value                                                   |
| --------------------- | -------- | ------------------------------------------------------- |
| Message length        | 4 bytes  | Big-endian count of all following bytes in this message |
| BitTorrent message ID | 1 byte   | `20`                                                    |
| Extension message ID  | 1 byte   | Your client's advertised `ut_metadata` ID               |
| Header dictionary     | Variable | Bencoded `msg_type`, `piece` and `total_size` fields    |
| Metadata bytes        | Variable | The requested chunk of the encoded info dictionary      |

For a data message, `msg_type` is `1` and `piece` is the requested metadata
index, `0` here. The `total_size` is the total metadata size in bytes, excluding
the header dictionary.

The header dictionary and metadata bytes follow each other without a separator.
Decode one complete Bencoded dictionary to find where the header ends. Its first
`e` might close an integer, so it does not identify the end of the dictionary.
The remaining bytes are the metadata chunk.

### Verifying the info dictionary

The metadata is the encoded
[info dictionary](https://www.bittorrent.org/beps/bep_0003.html#info-dictionary),
rather than a complete `.torrent` file. It has fields like these, shown as JSON
with placeholders for the binary piece hashes:

```json
{
  "piece length": 262144,
  "pieces": "<hash1><hash2>...",
  "name": "debian-12.3.0-amd64-netinst.iso",
  "length": 67108864
}
```

The challenge's metadata fits in piece `0`. Check SHA-1 of the exact received
metadata bytes against the info hash from the magnet link. Hashing the decoded
object or its JSON display would give a different result.

Once verified, decode the info dictionary to obtain the file length, piece
length and ordered piece hashes. The tracker URL still comes from the magnet
link.

### Tests

The tester executes:

```
$ ./your_program.sh magnet_info <magnet-link>
```

For the `magnet1.gif` link introduced earlier, the output is:

```
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 636505
Info Hash: ad42ce8109f54c99613ce38f9b4d87e70f24a165
Piece Length: 262144
Piece Hashes:
3b46a96d9bc3716d1b75da91e6d753a793ad1cef
eda417cb5c1cdbf841125c412da0bec9db8301f3
422f45b1052e2d45da3e2a6516e1bb1f1db00733
```

Use the supplied link and received metadata to produce these fields. Keep the
labels and the original piece-hash order.

### Notes

- All metadata used in this extension fits in one 16 KiB chunk. A single
  metadata chunk can describe many file pieces.
- You can use the
  [sample magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt)
  to test your program locally.
