The entry point for your BitTorrent implementation is in `app/src/main/kotlin/App.kt`.

Study and uncomment the relevant code: 

```kotlin
// Uncomment this block to pass the first stage
val bencodedValue = args[1]
val decoded = decodeBencode(bencodedValue)
println(gson.toJson(decoded))
return
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
