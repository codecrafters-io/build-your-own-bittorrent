The entry point for your BitTorrent implementation is in `app/main.rb`.

Study and uncomment the relevant code: 

```ruby
# Uncomment this block to pass the first stage
encoded_str = ARGV[1]
decoded_str = decode_bencode(encoded_str)
puts JSON.generate(decoded_str)
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
