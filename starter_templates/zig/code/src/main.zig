const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const args = try init.minimal.args.toSlice(init.arena.allocator());

    var stdout = std.Io.File.stdout().writer(init.io, &.{});
    var stderr = std.Io.File.stderr().writer(init.io, &.{});

    if (args.len < 3) {
        try stdout.interface.print("Usage: your_program.sh <command> <args>\n", .{});
        std.process.exit(1);
    }

    const command = args[1];

    if (std.mem.eql(u8, command, "decode")) {
        // You can use print statements as follows for debugging, they'll be visible when running tests.
        try stderr.interface.print("Logs from your program will appear here\n", .{});

        // TODO: Uncomment the code below to pass the first stage
        //
        // const encodedStr = args[2];
        // const decodedStr = decodeBencode(encodedStr) catch {
        //     try stderr.interface.print("Invalid encoded value\n", .{});
        //     std.process.exit(1);
        // };
        // var stringify = std.json.Stringify{ .writer = &stdout.interface };
        // try stringify.write(decodedStr);
        // try stdout.interface.print("\n", .{});
    }
}

fn decodeBencode(encodedValue: []const u8) ![]const u8 {
    if (encodedValue[0] >= '0' and encodedValue[0] <= '9') {
        const firstColon = std.mem.indexOf(u8, encodedValue, ":");
        if (firstColon == null) {
            return error.InvalidArgument;
        }
        return encodedValue[firstColon.? + 1 ..];
    } else {
        // Only strings are supported at the moment
        std.process.exit(1);
    }
}
