Torrent metadata uses named fields such as `announce` and `info`. In this stage,
you'll decode the Bencoded dictionaries that associate those names with values.

### Bencoded dictionaries

A dictionary is encoded as `d<key1><value1>...<keyN><valueN>e`. `<key1>`,
`<value1>` etc. correspond to the bencoded keys and values. Keys must be byte
strings, sorted lexicographically by their raw bytes.

For example, `{"hello": 52, "foo":"bar"}` would be encoded as:
`d3:foo3:bar5:helloi52ee` (note that the keys were reordered).

Values can be any Bencode type, including lists or nested dictionaries. Each `e`
closes its own integer, list or dictionary. The empty dictionary is `de`. Print
the decoded result as a JSON object, retaining the nested structure.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh decode d3:foo3:bar5:helloi52ee
{"foo":"bar","hello":52}
```

{{#lang_is_go}}

### Notes

If you'd prefer to use a library for this stage,
[bencode-go](https://github.com/jackpal/bencode-go) is available for you to use.
{{/lang_is_go}} {{#lang_is_python}}

### Notes

If you'd prefer to use a library for this stage,
[bencode.py](https://pypi.org/project/bencode.py/) is available for you to use.
{{/lang_is_python}} {{#lang_is_rust}}

### Notes

If you'd prefer to use a library crate for this stage,
[serde-bencode](https://github.com/toby/serde-bencode/) is available for you to
use. {{/lang_is_rust}} {{#lang_is_java}}

### Notes

If you'd prefer to use a library for this stage,
[bencode](https://github.com/dampcake/bencode) parser is available for you to
use. {{/lang_is_java}} {{#lang_is_kotlin}}

### Notes

If you'd prefer to use a library for this stage,
[bencode](https://github.com/dampcake/bencode) parser is available for you to
use. {{/lang_is_kotlin}}
