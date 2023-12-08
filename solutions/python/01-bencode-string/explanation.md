The entry point for your BitTorrent implementation is in `app/main.py`.

Study and uncomment the relevant code: 

```python
# Uncomment this block to pass the first stage
print(json.dumps(decode_bencode(bencoded_value), default=bytes_to_str))
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
