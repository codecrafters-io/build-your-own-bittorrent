The entry point for your BitTorrent implementation is in `src/main.zig`.

Study and uncomment the relevant code: 

```zig
// Uncomment this block to pass the first stage

const encodedStr = args[2];
const decodedStr = decodeBencode(encodedStr) catch {
    std.debug.print("Invalid encoded value\n", .{});
    std.process.exit(1);
};
var stringify = std.json.Stringify{ .writer = stdout };
try stringify.write(decodedStr);
try stdout.writeAll("\n");
try stdout.flush();
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
