In this stage, you'll send back a list of extensions that your client supports.

### Extension IDs & handshake

Each peer maintains a mapping of extension names to IDs. The same extension name might map to different IDs on different peers (but it'll always remain stable for a given peer).

To communicate with other peers using the [metadata extension](https://www.bittorrent.org/beps/bep_0009.html#ut_metadata), your peer will
need to know the ID that the other peer uses for this extension. The name for the metadata extension is `ut_metadata`. To get the ID,
your peer will need to send an [extension handshake](https://www.bittorrent.org/beps/bep_0010.html#handshake-message) message and
wait for the corresponding handshake message back from the peer.

The extension handshake message contains a dictionary like this:

```json
{
  "m": {
    "ut_metadata": 16,
    ... (other extension names and IDs)
  }
}
```

In the example above, `16` is the ID that the peer uses for the metadata extension. This is just an example, you can use any value you want for this ID.

Your program will need to send the extension handshake message soon after receiving the bitfield message. Overall, the flow will look like this:

- Establish a TCP connection with a peer
- Send the base handshake message
- Receive the base handshake message
- Send the bitfield message (safe to ignore in this challenge)
- Receive the bitfield message
- If the peer supports extensions (based on the reserved bit in the base handshake):
  - Send the extension handshake message
  - Receive the extension handshake message

Note that the extension handshake message is only sent if the other peer supports extensions (indicated by the reserved bit in the base handshake). This
is how backward compatibility is maintained with peers that don't support extensions.

We'll implement sending extension handshake messages in this stage. Receiving extension handshake messages will be implemented in the next stage.

### Extension handshake format

Extension messages follow the standard BitTorrent message format:

- message length prefix (4 bytes)
- message id (1 byte)
  - This will be 20 for all messages implemented by extensions
- payload (variable size)

The payload will be structured as follows:

- extension message id (1 byte)
  - This will be 0 for the extension handshake
- bencoded dictionary (variable size)
  - This will contain a key "m" with another dictionary as its value.
  - The inner dictionary maps supported extension names to their corresponding message IDs.
  - For example, the inner dictionary contents might be `{"ut_metadata": 1, "ut_pex": 2}`, indicating that your peer supports the "ut_metadata" and "ut_pex" extensions with IDs 1 and 2 respectively.

The extension name we're interested in is "ut_metadata", which corresponds to the [metadata extension](https://www.bittorrent.org/beps/bep_0009.html#ut_metadata).

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh magnet_handshake <magnet-link>
```

The expected output should look like this:

```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
```

The expected output is same as last stage. In this stage, the tester will additionaly verify that:

- An extension handshake message is received.
- The extension handshake message contains a dictionary that looks like this: `{"m": {"ut_metadata": <PICK YOUR ID>}}`.
- The ID corresponding to `ut_metadata` is between 1 and 255 (it needs to be represented as an 8-bit unsigned integer, that isn't 0)

### Notes

- Your program must only send an extension handshake **if** the peer supports extensions
  - To know whether a peer supports the extension protocol, you'll need to look at the reserved bytes in the base handshake message
- The extension handshake message is defined in [handshake section](https://www.bittorrent.org/beps/bep_0010.html#handshake-message) of extension protocol doc.