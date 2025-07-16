In this stage, you'll extend the `decode` command to support bencoded lists.

Lists are encoded as `l<bencoded_elements>e`.

For example, `["hello", 52]` would be encoded as `l5:helloi52ee`. Note that there are no separators between the elements.

Here’s how the tester will execute your program:
```
$ ./your_program.sh decode l5:helloi52ee
[“hello”,52]
```

{{#lang_is_go}}
If you'd prefer to use a library for this stage, [bencode-go](https://github.com/jackpal/bencode-go) is available for you to use.
{{/lang_is_go}}
{{#lang_is_python}}
If you'd prefer to use a library for this stage, [bencode.py](https://pypi.org/project/bencode.py/) is available for you to use.
{{/lang_is_python}}
{{#lang_is_rust}}
If you'd prefer to use a library crate for this stage, [serde-bencode](https://github.com/toby/serde-bencode/) is available for you to use.
{{/lang_is_rust}}
{{#lang_is_java}}
If you'd prefer to use a library for this stage, [bencode](https://github.com/dampcake/bencode) parser is available for you to use.
{{/lang_is_java}}
{{#lang_is_kotlin}}
If you'd prefer to use a library for this stage, [bencode](https://github.com/dampcake/bencode) parser is available for you to use.
{{/lang_is_kotlin}}