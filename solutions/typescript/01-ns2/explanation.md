The entry point for your BitTorrent implementation is in `app/main.ts`.

Study and uncomment the relevant code: 

```typescript
// Uncomment this block to pass the first stage
try {
    const decoded = decodeBencode(bencodedValue);
    console.log(JSON.stringify(decoded));
} catch (error) {
    console.error(error.message);
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
