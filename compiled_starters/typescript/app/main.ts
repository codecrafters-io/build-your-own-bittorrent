function decodeBencode(bencodedValue: Uint8Array): string {
    const decoder = new TextDecoder("utf-8");
    const encodedStr = decoder.decode(bencodedValue);
    if (!isNaN(parseInt(encodedStr[0]))) {
        const firstColonIndex = encodedStr.indexOf(":");
        if (firstColonIndex === -1) {
            throw new Error("Invalid encoded value");
        }
        return encodedStr.substring(firstColonIndex + 1);
    } else {
        throw new Error("Only strings are supported at the moment");
    }
}

const args = Deno.args;
const pattern = args[1];

if (args[0] === "decode") {
    const bencodedValue = new TextEncoder().encode(pattern);

    // You can use print statements as follows for debugging, they'll be visible when running tests.
    console.log("Logs from your program will appear here!");

    // Uncomment this block to pass the first stage
    // try {
    //     const decoded = decodeBencode(bencodedValue);
    //     console.log(JSON.stringify(decoded));
    // } catch (error) {
    //     console.error(error.message);
    // }
}
