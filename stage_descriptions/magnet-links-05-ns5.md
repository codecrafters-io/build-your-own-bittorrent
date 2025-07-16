In this stage, you'll request torrent metadata from a peer using the metadata extension.

### Metadata extension messages

As mentioned earlier, a magnet link doesn't contain all the information found in a .torrent file, such as file length, piece length and piece hashes.

To fetch these additional details, your client will need to use messages defined by the [metadata extension](https://www.bittorrent.org/beps/bep_0009.html#extension-message).

The metadata extension supports the following message types:

- `request` (msg_type: 0)
  - Requests a piece of metadata from the peer
- `data` (msg_type: 1)
  - Sends a piece of metadata to the peer
- `reject` (msg_type: 2)
  - Signals that the peer doesn't have the piece of metadata that was requested

`msg_type` is an identifier for message types within the metadata extension.

Metadata is stored in "pieces", which are 16kiB chunks. For the purposes of this challenge, you can assume that the entire metadata for a torrent fits in a single piece.

You'll implement sending the `request` message (msg_type: 0) in this stage. We'll look at other `msg_type` values in later stages.

### The metadata `request` message

As seen above, the `request` message is part of the metadata extension.

Note that this `request` message is different from the request message (ID: 6) in the base [BitTorrent protocol](https://www.bittorrent.org/beps/bep_0003.html).

This message follows the standard BitTorrent extension message format:

- message length prefix (4 bytes)
- message id (1 byte)
    - This will be 20, since this is a message implemented by an extension
- payload (variable size)
    - extension message id (1 byte)
        - This will be the peer's metadata extension ID, which you received during the extension handshake
    - bencoded dictionary (variable size)
        - This dictionary will look like this: `{'msg_type': 0, 'piece': 0}` (encoded as a bencoded dictionary)
        - `msg_type` will be 0 since this is a `request` message
        - `piece` is the zero-based piece index of the metadata being requested
            - Since we're only requesting one piece in this challenge, this will always be 0

### The `magnet_info` command

To test your program, we'll introduce a new command in this stage: `magnet_info`. Here's how it works:

```bash
$ ./your_program.sh magnet_info <magnet-link>
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 92063
Info Hash: d69f91e6b2ae4c542468d1073a71d4ea13879a7f
Piece Length: 32768
Piece Hashes:
6e2275e604a0766656736e81ff10b55204ad8d35
e876f67a2a8886e8f36b136726c30fa29703022d
f00d937a0213df1982bc8d097227ad9e909acc17
```

To fetch this info, your program will need to:

- Parse the magnet link to get the tracker URL
- Perform the tracker GET request to get a list of peers
- Establish a TCP connection with a peer, and perform a handshake
- Perform the base handshake
- Send the bitfield message (can be ignored in this challenge)
- Receive the bitfield message
- Perform the extension handshake
- Send the metadata request message (**This stage**)
- Receive the metadata message (later stages)
- Print out the data received, as per the format above.

### Tests

Here's how the tester will execute your program:

```bash
$ ./your_program.sh magnet_info <magnet-link>
```

There's no expected output at this stage, the tester will just assert if it received a correct metadata request. We'll
verify the output in later stages.

### Notes

- If metadata is larger than 16kb, you would need to request multiple pieces, but for the purposes of this challenge there will only be one piece.