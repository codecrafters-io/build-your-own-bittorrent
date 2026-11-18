Your client can discover peers and complete a handshake. In this stage, you'll
download one requested piece, verify its hash and save its bytes to disk.

### From the handshake to file data

After tracker discovery and the peer handshake, exchange
[peer messages](https://www.bittorrent.org/beps/bep_0003.html#peer-messages) to
request file data. A piece is transferred in smaller blocks, each addressed by
its offset within that piece.

### Peer messages

After the handshake, a peer message begins with a four-byte big-endian length.
For non-keepalive messages, the length counts the one-byte message ID and
payload, excluding the length prefix itself. A zero length indicates a
keepalive, which has neither a message ID nor a payload.

The `index`, `begin` and `length` fields below are also four-byte big-endian
integers. These are binary integers, so send their bytes rather than decimal
text.

An `interested` message says your client wants data. An `unchoke` message gives
it permission to request blocks from that peer. Connections begin choked, which
means the peer is not yet willing to send file data.

Here are the peer messages you'll need to exchange once the handshake is
complete:

<!-- prettier-ignore -->
- Wait for a `bitfield` message from the peer indicating which pieces it has
    - The message ID for this message type is `5`.
    - You can read and ignore the payload for now. The peers used in this
      challenge have all pieces available.
- Send an `interested` message
    - The message ID for `interested` is `2`.
    - The payload for this message is empty.
- Wait until you receive an `unchoke` message back
    - The message ID for `unchoke` is `1`.
    - The payload for this message is empty.
- Break the piece into blocks of 16 KiB (16 \* 1024 bytes) and send a `request`
  message for each block
    - The message ID for `request` is `6`.
    - The payload for this message consists of:
        - `index`: the zero-based piece index
        - `begin`: the zero-based byte offset within the piece
            - This'll be `0` for the first block, `2^14` for the second block, 2\*2^14
              for the third block etc.
        - `length`: the length of the block in bytes
            - This'll be `2^14` (16 \* 1024) for all blocks except the last one.
            - The last block will contain `2^14` bytes or less. Use the actual size of
              the requested piece to determine the remaining bytes.
- Wait for a `piece` message for each block you've requested
    - The message ID for `piece` is `7`.
    - The payload for this message consists of:
        - `index`: the zero-based piece index
        - `begin`: the zero-based byte offset within the piece
        - `block`: the requested data block, up to `2^14` bytes long

The final file piece may be shorter than `piece length`. For example, the
`92063`-byte sample with `32768`-byte pieces has a final piece of `26527` bytes.
Its last block is therefore shorter than `16384` bytes.

Combine the received blocks in `begin` order and compare SHA-1 of the completed
piece with its expected hash from the torrent. The file named by `-o` must
contain exactly that piece's raw bytes.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh download_piece -o /tmp/test-piece sample.torrent <piece_index>
```

The tester checks the output file's size and SHA-1 hash, including requests for
a shorter final piece. Exit with code `0` after saving the correct data.

### Notes

- TCP responses may return partial data for a block, so be sure to accumulate
  reads until the full block is received.
- Pipelining block requests is optional. Keeping several requests in flight can
  avoid waiting for a round trip between blocks. The
  [BitTorrent economics paper](http://bittorrent.org/bittorrentecon.pdf)
  discusses this technique.
