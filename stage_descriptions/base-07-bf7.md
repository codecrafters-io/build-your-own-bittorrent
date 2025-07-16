In a torrent, a file is split into equally-sized parts called **pieces**. A piece is usually 256 KB or 1 MB in size.

Each piece is assigned a SHA-1 hash value. On public networks, there may be malicious peers that send fake data. These hash values allow us to verify the integrity of each piece that we'll download.

Piece length and piece hashes are specified in the `info` dictionary of the torrent file under the following keys:

- `piece length`: number of bytes in each piece, an integer
- `pieces`: concatenated SHA-1 hashes of each piece (20 bytes each), a string

The [BitTorrent Protocol Specification](https://www.bittorrent.org/beps/bep_0003.html#info-dictionary) has more information about these keys.

In this stage, the tester will expect your program to print piece length and a list of piece hashes in hexadecimal format.

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