An info hash identifies the torrent's metadata, while piece hashes let you check
the downloaded file data. In this stage, you'll print the piece length and
ordered piece hashes.

### Pieces and their hashes

A file is split into pieces of the configured `piece length`. The last piece can
be shorter. Each piece has an expected SHA-1 hash, so a client can detect
downloaded bytes that do not match the torrent metadata, including incorrect
data sent by a peer.

Piece length and piece hashes are specified in the `info` dictionary of the
torrent file under the following keys:

- `piece length`: number of bytes in each piece, an integer
- `pieces`: concatenated SHA-1 hashes of each piece (20 bytes each), a Bencoded
  byte string

The
[BitTorrent Protocol Specification](https://www.bittorrent.org/beps/bep_0003.html#info-dictionary)
has more information about these keys.

The first 20 bytes hold the hash for piece `0`, the next 20 for piece `1`, and
so on. Preserve that order when printing the 40-character hexadecimal hashes.
For the sample below, two pieces contain `32768` bytes each, and the final piece
contains `26527` bytes.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh info sample.torrent
```

The expected output should look like this:

```
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 92063
Info Hash: d69f91e6b2ae4c542468d1073a71d4ea13879a7f
Piece Length: 32768
Piece Hashes:
e876f67a2a8886e8f36b136726c30fa29703022d
6e2275e604a0766656736e81ff10b55204ad8d35
f00d937a0213df1982bc8d097227ad9e909acc17
```
