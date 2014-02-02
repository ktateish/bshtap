#!/bin/sh
# vim:ft=sh:

. $(dirname $0)/../bshtap

tests 17
cmp_ok true -eq 0 "eq test #1"
cmp_ok false -eq 1 "eq test #2"
cmp_ok true -ne 1 "ne test #1"
cmp_ok false -ne 0 "ne test #2"
cmp_ok true = 0 "= test #1"
cmp_ok false = 1 "= test #2"
cmp_ok true != 1 "!= test #1"
cmp_ok false != 0 "!= test #2"
cmp_ok "printf 'foo\n'" -eq 0 "checking only return value #1"
cmp_ok "printf 'foo\n'" != "foo" "checking only return value #2"
cmp_ok "exit 127" -eq 127 "test Other values #1"
cmp_ok "exit 126" -eq 126 "test Other values #2"
cmp_ok '
true
' -eq 0 "with newline"
cmp_ok 'false; true' -eq 0 "two commands"
cmp_ok '( false; true; )' -eq 0 "subshell"
cmp_ok 'false | true' -eq 0 "pipe"
cmp_ok 'printf "not ok - dummy\n"' -eq 0 "stdout will be commented out"
