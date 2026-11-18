Your client knows which file it wants, but still needs peers that can send the
data. In this stage, you'll query an HTTP tracker and print the returned peer
addresses.

### Finding peers

A tracker is a server that returns contact information for other clients sharing
the torrent. Those clients are called peers. The tracker supplies their
addresses, and the file data comes from the peers.

### Tracker GET request

You'll need to make a request to the tracker URL you extracted from `announce`,
and include these query params:

- `info_hash`: the info hash of the torrent
  - Percent-encode the raw 20-byte digest for the URL query. For example, byte
    `ff` becomes `%FF`.
  - The 40-character hexadecimal display form from `info` is a different
    representation and must not be sent as `info_hash`
- `peer_id`: a unique identifier for your client
  - A 20-byte value that you choose for your client. Percent-encode it for the
    URL query too.
- `port`: the port your client is listening on
  - You can set this to `6881`. You don't need to accept incoming connections in
    this challenge.
- `uploaded`: the total amount uploaded so far
  - Since your client hasn't uploaded anything yet, you can set this to `0`.
- `downloaded`: the total amount downloaded so far
  - Since your client hasn't downloaded anything yet, you can set this to `0`.
- `left`: the number of bytes left to download
  - Since your client hasn't downloaded anything yet, this'll be the total
    length of the file (you've extracted this value from the torrent file in
    previous stages)
- `compact`: whether the peer list should use the
  [compact representation](https://www.bittorrent.org/beps/bep_0023.html)
  - For the purposes of this challenge, set this to `1`.

Read
[the BitTorrent Protocol Specification](https://www.bittorrent.org/beps/bep_0003.html#trackers)
for more information about these query parameters.

### Tracker response

The tracker's response is a bencoded dictionary that includes the following
keys:

- `interval`:
  - An integer counting the seconds between regular tracker requests.
  - You can ignore this value for the purposes of this challenge.
- `peers`:
  - A byte string containing addresses of peers your client can connect to.
  - Each IPv4 peer occupies 6 bytes. The first 4 bytes are its address octets,
    and the last 2 hold its port in big-endian order, with the most significant
    byte first. For example, `7f 00 00 01 1a e1` represents `127.0.0.1:6881`.

You can ignore other entries in this challenge.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh peers sample.torrent
```

The expected output should look like this:

```
165.232.41.73:51556
165.232.38.164:51493
165.232.35.114:51476
```

Print one `IP:port` entry per line on stdout. The addresses above illustrate the
format. Use the peers returned by the tracker rather than fixed addresses.
