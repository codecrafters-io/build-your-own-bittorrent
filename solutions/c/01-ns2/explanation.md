The entry point for your BitTorrent implementation is in `src/main.c`.

Study and uncomment the relevant code: 

```c
// Uncomment this block to pass the first stage
const char* encoded_str = argv[2];
char* decoded_str = decode_bencode(encoded_str);
printf("\"%s\"\n", decoded_str);
free(decoded_str);
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
