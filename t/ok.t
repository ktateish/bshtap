#!/bin/sh
# vim:ft=sh:

. $(dirname $0)/../bshtap

tests 8
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
