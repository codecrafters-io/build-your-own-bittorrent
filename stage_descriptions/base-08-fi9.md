Trackers are central servers that maintain information about peers participating in the sharing and downloading of a torrent.

In this stage, you'll make a GET request to a HTTP tracker to discover peers to download the file from.

### Tracker GET request

You'll need to make a request to the tracker URL you extracted in the previous stage, and include these query params:

- `info_hash`: the info hash of the torrent
    - 20 bytes long, will need to be URL encoded
    - **Note**: this is **NOT** the hexadecimal representation, which is 40 bytes long
- `peer_id`: a unique identifier for your client
    - A string of length 20 that you get to pick.
- `port`: the port your client is listening on
    - You can set this to `6881`, you will not have to support this functionality during this challenge.
- `uploaded`: the total amount uploaded so far
    - Since your client hasn't uploaded anything yet, you can set this to `0`.
- `downloaded`: the total amount downloaded so far
    - Since your client hasn't downloaded anything yet, you can set this to `0`.
- `left`: the number of bytes left to download
    - Since you client hasn't downloaded anything yet, this'll be the total length of the file (you've extracted this value from the torrent file in previous stages)
- `compact`: whether the peer list should use the [compact representation](https://www.bittorrent.org/beps/bep_0023.html)
    - For the purposes of this challenge, set this to `1`.
    - The compact representation is more commonly used in the wild, the non-compact representation is mostly supported for backward-compatibility.

Read [the BitTorrent Protocol Specification](https://www.bittorrent.org/beps/bep_0003.html#trackers) for more information about these query parameters.

### Tracker response

The tracker's response will be a bencoded dictionary with two keys:

- `interval`:
    - An integer, indicating how often your client should make a request to the tracker.
    - You can ignore this value for the purposes of this challenge.
- `peers`.
    - A string, which contains list of peers that your client can connect to.
    - Each peer is represented using 6 bytes. The first 4 bytes are the peer's IP address and the last 2 bytes are the peer's port number.

---

Here’s how the tester will execute your program:
```
$ ./your_program.sh peers sample.torrent
```
The expected output should look like this:
```
165.232.41.73:51556
165.232.38.164:51493
165.232.35.114:51476
```