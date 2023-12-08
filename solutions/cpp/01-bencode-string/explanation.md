The entry point for your BitTorrent implementation is in `src/Main.cpp`.

Study and uncomment the relevant code: 

```cpp
// Uncomment this block to pass the first stage
std::string encoded_value = argv[2];
json decoded_value = decode_bencoded_value(encoded_value);
std::cout << decoded_value.dump() << std::endl;
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
