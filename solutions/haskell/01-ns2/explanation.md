The entry point for your BitTorrent implementation is in `app/Main.hs`.

Study and uncomment the relevant code: 

```haskell
-- Uncomment this block to pass stage 1
let encodedValue = args !! 1
let decodedValue = decodeBencodedValue(B.pack encodedValue)
let jsonValue = encode(B.unpack decodedValue)
LB.putStr jsonValue
putStr "\n"
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
