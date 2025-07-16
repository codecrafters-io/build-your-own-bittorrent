In this stage, you'll receive torrent metadata from a peer.

### The metadata `data` message

The `data` message is the response to the `request` message that your peer sent in the previous stage.

It contains the actual metadata, which you'll need to download the file.

This message follows the standard BitTorrent extension message format:

- message length prefix (4 bytes)
- message id (1 byte)
  - This will be 20, since this is a message implemented by an extension
- payload (variable size)
    - extension message id (1 byte)
      - This will be your peer's metadata extension ID, which you sent as part of the extension handshake
    - bencoded dictionary (variable size)
      - This dictionary will look like this: `{'msg_type': 1, 'piece': 0, 'total_size': XXXX}`
      - `msg_type` will be 1, since this is a `data` message
      - `piece` will be 0, since we're only requesting one piece in this challenge
      - `total_size` will be the length of the metadata piece
    - metadata piece contents (variable size)

The "metadata piece contents" is what you're interested in. When these pieces are combined, they'll form a bencoded dictionary that
looks something like this (presented as JSON for readability):

```
{
  "piece length": 262144,
  "pieces": "<hash1><hash2>...",
  "name": "debian-12.3.0-amd64-netinst.iso",
  "length": 67108864
}
```

This is same as the [info dictionary](https://www.bittorrent.org/beps/bep_0003.html#info-dictionary) in a .torrent file, which you've seen in previous stages.

You should be able to compute the hash of this and validate it against the info hash present in the magnet link.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh magnet_info <magnet-link>
```

The expected output should look like this:

```
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 92063
Info Hash: d69f91e6b2ae4c542468d1073a71d4ea13879a7f
Piece Length: 32768
Piece Hashes:
6e2275e604a0766656736e81ff10b55204ad8d35
e876f67a2a8886e8f36b136726c30fa29703022d
f00d937a0213df1982bc8d097227ad9e909acc17
```

### Notes

- For this challenge, all torrents we use will have a single metadata piece (i.e. it'll fit in one 16kiB chunk).
- You can use [these magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt) to test your program locally.