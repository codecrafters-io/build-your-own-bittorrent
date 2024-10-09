import Foundation

// Example:
// - 5:hello -> hello
// - 10:hello12345 -> hello12345
enum DecodingError: Error {
    case invalidFormat
    case invalidLength
    case unsupportedType
}

func decodeBencode(_ bencodedString: String) throws -> String {
    if let firstChar = bencodedString.first, firstChar.isNumber {
        guard let colonIndex = bencodedString.firstIndex(of: ":") else {
            throw DecodingError.invalidFormat
        }
        
        let lengthStr = String(bencodedString[..<colonIndex])
        guard let length = Int(lengthStr) else {
            throw DecodingError.invalidLength
        }
        
        let startIndex = bencodedString.index(after: colonIndex)
        let endIndex = bencodedString.index(startIndex, offsetBy: length)
        return String(bencodedString[startIndex..<endIndex])
    } else {
        throw DecodingError.unsupportedType
    }
}

// You can use print statements as follows for debugging, they'll be visible when running tests.
print("Logs from your program will appear here!")

let arguments = CommandLine.arguments

guard arguments.count > 1 else {
    print("No command provided")
    exit(1)
}

let command = arguments[1]

if command == "decode" {
    // Uncomment this block to pass the first stage
    //
    // guard arguments.count > 2 else {
    //     print("No Bencode value provided")
    //     exit(1)
    // }
    // let bencodedValue = arguments[2]
    //
    // do {
    //     let decoded = try decodeBencode(bencodedValue)
    //     print("\"\(decoded)\"")
    // } catch {
    //     print(error.localizedDescription)
    //     exit(1)
    // }
} else {
    print("Unknown command: \(command)")
    exit(1)
}
