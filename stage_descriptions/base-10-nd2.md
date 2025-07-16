In this stage, you'll download one piece and save it to disk. In the next stage we'll combine these pieces into a file.

To download a piece, your program will need to send [peer messages](https://www.bittorrent.org/beps/bep_0003.html#peer-messages) to a peer. The overall flow looks like this:

- Read the torrent file to get the tracker URL
    - you've done this in previous stages
- Perform the tracker GET request to get a list of peers
    - you've done this in previous stages
- Establish a TCP connection with a peer, and perform a handshake
    - you've done this in previous stages
- Exchange multiple [peer messages](https://www.bittorrent.org/beps/bep_0003.html#peer-messages) to download the file
    - **This is the part you'll implement in this stage**

### Peer Messages

Peer messages consist of a message length prefix (4 bytes), message id (1 byte) and a payload (variable size).

Here are the peer messages you'll need to exchange once the handshake is complete:

- Wait for a `bitfield` message from the peer indicating which pieces it has
    - The message id for this message type is `5`.
    - You can read and ignore the payload for now, the tracker we use for this challenge ensures that all peers have all pieces available.
- Send an `interested` message
    - The message id for `interested` is `2`.
    - The payload for this message is empty.
- Wait until you receive an `unchoke` message back
    - The message id for `unchoke` is `1`.
    - The payload for this message is empty.
- Break the piece into blocks of 16 kiB (16 * 1024 bytes) and send a `request` message for each block
    - The message id for `request` is `6`.
    - The payload for this message consists of:
        - `index`: the zero-based piece index
        - `begin`: the zero-based byte offset within the piece
            - This'll be `0` for the first block, `2^14` for the second block, 2*2^14 for the third block etc.
        - `length`: the length of the block in bytes
            - This'll be `2^14` (16 * 1024) for all blocks except the last one.
            - The last block will contain `2^14` bytes or less, you'll need calculate this value using the piece length.
- Wait for a `piece` message for each block you've requested
    - The message id for `piece` is `7`.
    - The payload for this message consists of:
        - `index`: the zero-based piece index
        - `begin`: the zero-based byte offset within the piece
        - `block`: the data for the piece, usually `2^14` bytes long

After receiving blocks and combining them into pieces, you'll want to check the integrity of each piece by comparing its hash
with the piece hash value found in the torrent file.

Here’s how the tester will execute your program:

```
$ ./your_program.sh download_piece -o /tmp/test-piece sample.torrent <piece_index>
```

The tester will validate that the piece was downloaded correctly.

### Notes
- TCP responses may return partial data for a block, so be sure to accumulate reads until the full block is received.
- **Optional:** To improve download speeds, you can consider pipelining your requests. [BitTorrent Economics Paper](http://bittorrent.org/bittorrentecon.pdf) recommends having 5 requests pending at once, to avoid a delay between blocks being sent.