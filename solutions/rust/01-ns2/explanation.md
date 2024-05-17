The entry point for your BitTorrent implementation is in `src/main.rs`.

Study and uncomment the relevant code: 

```rust
// Uncomment this block to pass the first stage
let encoded_value = &args[2];
let decoded_value = decode_bencoded_value(encoded_value);
println!("{}", decoded_value.to_string());
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
