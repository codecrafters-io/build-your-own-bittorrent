Your client can download and verify a piece. In this stage, you'll assemble all
the pieces into the complete file and save it to disk.

### Assembling the file

A single peer is sufficient for this stage. Keep the piece-download and hash
checks you already implemented. Assemble pieces by their zero-based indexes,
even if they arrive in a different order. The final file must contain exactly
the `length` bytes declared in the info dictionary, including the shorter final
piece.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh download -o /tmp/test.txt sample.torrent
```

The tester checks the saved file's size and SHA-1 hash. Write file contents to
the `-o` path and exit with code `0` on success.

### Notes

- Downloading from several peers at once is optional. The required piece
  ordering and hash checks stay the same.
