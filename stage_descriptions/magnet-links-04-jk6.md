In this stage, you'll add support for receiving the extension handshake message back.

### Extension handshake (part 2)

In the previous stage, your client sent an extension handshake message to the other peer. In this stage, you'll
add support for receiving the peer's extension handshake message back.

The message will follow the same structure as the one you sent in the previous stage. The payload dictionary
will contain the following keys: `{"m": {"ut_metadata": <PEER'S ID>}}`.

Your program will need to store the ID for the `ut_metadata` extension and print it out. This'll be used in later stages to send extension messages specific to the `ut_metadata` extension.

To recap, the overall flow will look like this:

- Establish a TCP connection with a peer
- Send the base handshake message
- Receive the base handshake message
- Send the bitfield message (safe to ignore in this challenge)
- Receive the bitfield message
- If the peer supports extensions (based on the reserved bit in the base handshake):
  - Send the extension handshake message (previous stage)
  - Receive the extension handshake message (**this stage**)

### Tests

Here's how the tester will execute your program:

```bash
$ ./your_program.sh magnet_handshake <magnet-link>
```

The expected output should look like this:

```
Peer ID: 0102030405060708090a0b0c0d0e0f1011121314
Peer Metadata Extension ID: 123
```

The `Peer Metadata Extension ID` will be randomly generated, you'll need to fetch it from the dictionary in the extension handshake message.

### Notes

- You can use [these magnet links](https://github.com/codecrafters-io/bittorrent-test-seeder/blob/main/torrent_files/magnet_links.txt) to test your program locally. You may need to surround links with double quotes to escape special characters in terminal.
- Extension IDs need to be stored for every peer, as different peers may use different IDs for the same extension.