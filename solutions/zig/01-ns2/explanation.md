The entry point for your BitTorrent implementation is in `src/main.zig`.

Study and uncomment the relevant code: 

```zig
// Uncomment this block to pass the first stage
const encodedStr = args[2];
const decodedStr = decodeBencode(encodedStr) catch {
    try stdout.print("Invalid encoded value\n", .{});
    std.process.exit(1);
};
var string = std.ArrayList(u8).init(allocator);
try std.json.stringify(decodedStr.*, .{}, string.writer());
const jsonStr = try string.toOwnedSlice();
try stdout.print("{s}\n", .{jsonStr});
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
