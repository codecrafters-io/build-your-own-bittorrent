The entry point for your BitTorrent implementation is in `lib/main.ex`.

Study and uncomment the relevant code: 

```elixir
# Uncomment this block to pass the first stage
decoded_str = Bencode.decode(encoded_str)
IO.puts(Jason.encode!(decoded_str))
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
