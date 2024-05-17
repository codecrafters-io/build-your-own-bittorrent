The entry point for your BitTorrent implementation is in `app/main.js`.

Study and uncomment the relevant code: 

```javascript
// Uncomment this block to pass the first stage
if (command === "decode") {
  const bencodedValue = process.argv[3];

  // In JavaScript, there's no need to manually convert bytes to string for printing
  // because JS doesn't distinguish between bytes and strings in the same way Python does.
  console.log(JSON.stringify(decodeBencode(bencodedValue)));
} else {
  throw new Error(`Unknown command ${command}`);
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
