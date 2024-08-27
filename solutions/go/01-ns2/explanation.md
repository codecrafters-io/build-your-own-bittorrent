The entry point for your BitTorrent implementation is in `cmd/mybittorrent/main.go`.

Study and uncomment the relevant code: 

```go
// Uncomment this block to pass the first stage

bencodedValue := os.Args[2]

decoded, err := decodeBencode(bencodedValue)
if err != nil {
	fmt.Println(err)
	return
}

jsonOutput, _ := json.Marshal(decoded)
fmt.Println(string(jsonOutput))
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
