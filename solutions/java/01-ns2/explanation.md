The entry point for your BitTorrent implementation is in `src/main/java/Main.java`.

Study and uncomment the relevant code: 

```java
//  Uncomment this block to pass the first stage
 String bencodedValue = args[1];
 String decoded;
 try {
   decoded = decodeBencode(bencodedValue);
 } catch(RuntimeException e) {
   System.out.println(e.getMessage());
   return;
 }
 System.out.println(gson.toJson(decoded));
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
