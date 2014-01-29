#!/bin/sh
# vim:ft=sh:

. $(dirname $0)/../bshtap

tests 9
ok true "simple command"
ok "true" "command as string"
ok 'true' "command as string2"
ok '
true
' "with newline"
ok 'false; true' "two commands"
ok '( false; true; )' "subshell"
ok 'false | true' "pipe"
ok 'echo not ok - dummy' "stdout will be commented out"
ok 'exit 0' "exit can be used in test code"
