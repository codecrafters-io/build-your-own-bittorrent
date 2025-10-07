import com.google.gson.Gson;
// import com.dampcake.bencode.Bencode; - available if you need it!

val gson = Gson()

fun main(args: Array<String>) {
    val command = args[0]
    when (command) {
        "decode" -> {
            val bencodedValue = args[1]
            val decoded = decodeBencode(bencodedValue)
            println(gson.toJson(decoded))
            return
        }
        else -> println("Unknown command $command")
    }
}

fun decodeBencode(bencodedString: String): String {
    when {
        Character.isDigit(bencodedString[0]) -> {
            val firstColonIndex = bencodedString.indexOfFirst { it == ':' }
            val length = Integer.parseInt(bencodedString.substring(0, firstColonIndex))
            return bencodedString.substring(firstColonIndex + 1, firstColonIndex + 1 + length)
        }
        else -> TODO("Only strings are supported at the moment")
    }
}
