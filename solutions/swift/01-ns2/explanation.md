The entry point for your BitTorrent implementation is in `Sources/main.swift`.

Study and uncomment the relevant code: 

```swift
// Uncomment this block to pass the first stage

guard arguments.count > 2 else {
    print("No Bencode value provided")
    exit(1)
}
let bencodedValue = arguments[2]

do {
    let decoded = try decodeBencode(bencodedValue)
    print("\"\(decoded)\"")
} catch {
    print(error.localizedDescription)
    exit(1)
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
