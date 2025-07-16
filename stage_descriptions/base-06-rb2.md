Info hash is a unique identifier for a torrent file. It's used when talking to trackers or peers.

In this stage, you'll calculate the info hash for a torrent file and print it in hexadecimal format.

To calculate the info hash, you'll need to:

- Extract the `info` dictionary from the torrent file after parsing
- Bencode the contents of the `info` dictionary
- Calculate the SHA-1 hash of this bencoded dictionary

Here’s how the tester will execute your program:
```
$ ./your_program.sh info sample.torrent
```
The expected output should look like this:
```
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 92063
Info Hash: d69f91e6b2ae4c542468d1073a71d4ea13879a7f
```