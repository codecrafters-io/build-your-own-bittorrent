//> using dep com.lihaoyi::ujson:4.4.3

package codecrafters_bittorrent

@main def main(args: String*): Unit =
  if args.length < 2 then
    println("Usage: your_program.sh <command> <args>")
    sys.exit(1)

  val command = args(0)

  if command == "decode" then
    val encodedStr = args(1)
    val decodedStr = decodeBencode(encodedStr)
    println(ujson.write(ujson.Str(decodedStr), indent = -1))

// Examples:
// - decodeBencode("5:hello") -> "hello"
// - decodeBencode("10:hello12345") -> "hello12345"
def decodeBencode(bencodedValue: String): String =
  if bencodedValue.isEmpty then throw new IllegalArgumentException("Invalid encoded value")
  if bencodedValue(0).isDigit then
    val colonIdx = bencodedValue.indexOf(':')
    if colonIdx < 0 then throw new IllegalArgumentException("Invalid encoded value")
    bencodedValue.substring(colonIdx + 1)
  else
    println("Only strings are supported at the moment")
    sys.exit(1)
