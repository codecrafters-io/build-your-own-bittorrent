Your decoder handles individual strings and integers. In this stage, you'll
decode Bencoded lists that collect values together.

### Bencoded lists

Lists are encoded as `l<bencoded_elements>e`.

For example, `["hello", 52]` would be encoded as `l5:helloi52ee`. Note that
there are no separators between the elements.

Each element has its own Bencode representation, so its length or ending marker
determines where the following element begins. The final `e` closes the list.
Lists can contain other lists, and `le` represents an empty list. Preserve the
element order and print a JSON array.

### Tests

Here's how the tester will execute your program:

```
$ ./your_program.sh decode l5:helloi52ee
["hello",52]
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
