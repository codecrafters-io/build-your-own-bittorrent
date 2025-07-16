In this stage, you’ll establish a TCP connection with a peer and complete a handshake.

The handshake is a message consisting of the following parts as described in the [peer protocol](https://www.bittorrent.org/beps/bep_0003.html#peer-protocol):

1. length of the protocol string (BitTorrent protocol) which is `19` (1 byte)
2. the string `BitTorrent protocol` (19 bytes)
3. eight reserved bytes, which are all set to zero (8 bytes)
4. sha1 infohash (20 bytes) (**NOT** the hexadecimal representation, which is 40 bytes long)
5. peer id (20 bytes) (generate 20 random byte values)

After we send a handshake to our peer, we should receive a handshake back in the same format.

Your program should print the hexadecimal representation of the peer id you've received during the handshake.

Here’s how the tester will execute your program:
```
$ ./your_program.sh handshake sample.torrent <peer_ip>:<peer_port>
```
The expected output should look like this:
```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
```
(Exact value will be different as it is randomly generated.)

**Note**: To get a peer IP & port to test this locally, run `./your_program.sh peers sample.torrent` and pick any peer from the list.