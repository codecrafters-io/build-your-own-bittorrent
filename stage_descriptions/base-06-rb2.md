Peers and trackers use an info hash to identify the content being shared. In
this stage, you'll calculate that hash and add its hexadecimal form to the
`info` output.

### The info hash

SHA-1 maps bytes to a 20-byte digest, a fixed-size value used here to identify
torrent metadata. The info hash is SHA-1 of the original Bencoded `info`
dictionary. Fields outside that dictionary, such as the tracker URL, are
excluded.

Hash the encoded bytes exactly as they appear in the file. If you decode and
re-encode the dictionary, the result must preserve the original byte strings and
canonical key ordering. Hashing JSON or a text representation produces a
different value.

For display, encode each digest byte as two hexadecimal digits, giving a
40-character info hash. Later network messages use the original 20 digest bytes.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh info sample.torrent
```

The expected output should look like this:

```
Tracker URL: http://bittorrent-test-tracker.codecrafters.io/announce
Length: 92063
Info Hash: d69f91e6b2ae4c542468d1073a71d4ea13879a7f
```
