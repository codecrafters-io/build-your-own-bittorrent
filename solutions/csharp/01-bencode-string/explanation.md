The entry point for your BitTorrent implementation is in `src/Program.cs`.

Study and uncomment the relevant code: 

```csharp
// Uncomment this line to pass the first stage
var encodedValue = param;
if (Char.IsDigit(encodedValue[0]))
{
   // Example: "5:hello" -> "hello"
   var colonIndex = encodedValue.IndexOf(':');
   if (colonIndex != -1)
   {
       var strLength = int.Parse(encodedValue[..colonIndex]);
       var strValue = encodedValue.Substring(colonIndex + 1, strLength);
       Console.WriteLine(JsonSerializer.Serialize(strValue));
   }
   else
   {
       throw new InvalidOperationException("Invalid encoded value: " + encodedValue);
   }
}
else
{
   throw new InvalidOperationException("Unhandled encoded value: " + encodedValue);
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
