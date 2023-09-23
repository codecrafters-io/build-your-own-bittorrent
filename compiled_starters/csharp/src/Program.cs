using static System.Buffers.Binary.BinaryPrimitives;

// Parse arguments
var (command, param) = args.Length switch
{
    0 => throw new InvalidOperationException("Usage: your_bittorrent.sh <command> <param>"),
    1 => throw new InvalidOperationException("Usage: your_bittorrent.sh <command> <param>"),
    _ => (args[0], args[1])
};

// Parse command and act accordingly
if (command == "decode")
{
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    Console.WriteLine("Logs from your program will appear here!");

    // Uncomment this line to pass the first stage
    //var encodedValue = param;
    //if (Char.IsDigit(encodedValue[0]))
    //{
    //    // Example: "5:hello" -> "hello"
    //    int colonIndex = encodedValue.IndexOf(':');
    //    if (colonIndex != -1)
    //    {
    //        string numberString = encodedValue.Substring(0, colonIndex);
    //        long number = Convert.ToInt64(numberString);
    //        string stringValue = encodedValue.Substring(colonIndex + 1, (int)number);
    //        Console.WriteLine($"\"{stringValue}\"");
    //    }
    //    else
    //    {
    //        throw new InvalidOperationException("Invalid encoded value: " + encodedValue);
    //    }
    //}
    //else
    //{
    //    throw new InvalidOperationException("Unhandled encoded value: " + encodedValue);
    //}
}
else
{
    throw new InvalidOperationException($"Invalid command: {command}");
}
