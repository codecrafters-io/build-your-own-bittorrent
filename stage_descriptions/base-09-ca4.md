A peer handshake identifies the torrent and the clients at each end of a
connection. In this stage, you'll connect to a peer over TCP, exchange
handshakes and print its peer ID.

### The peer handshake

TCP supplies an ordered byte stream between your client and the peer. The
handshake confirms that both ends are communicating about the same torrent
before piece transfer begins.

The handshake is a message consisting of the following parts as described in the
[peer protocol](https://www.bittorrent.org/beps/bep_0003.html#peer-protocol):

1. length of the protocol string (BitTorrent protocol) which is `19` (1 byte)
2. the string `BitTorrent protocol` (19 bytes)
3. eight reserved bytes, which are all set to zero (8 bytes)
4. the raw SHA-1 info hash (20 bytes), decoded from its hexadecimal display form
   if necessary
5. your client's peer ID (20 random bytes)

This handshake occupies 68 bytes. Its first byte has numeric value `19` (`13` in
hexadecimal). It has no four-byte message-length prefix. After sending it,
receive the peer's handshake in the same format and check that its info hash
identifies the requested torrent.

A TCP read may return only part of the handshake, or include bytes from a later
message. The protocol's fields determine the boundary.

Your program should print the hexadecimal representation of the peer ID you've
received during the handshake.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh handshake sample.torrent <peer_ip>:<peer_port>
```

The expected output should look like this:

```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
```

(Exact value will be different as it is randomly generated.)

### Notes

- To get a peer IP and port to test this locally, run
  `./your_program.sh peers sample.torrent` and pick any peer from the list.
