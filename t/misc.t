#!/bin/sh
# vim:ft=sh:

. $(dirname $0)/../bshtap

printf "1..10\n"
is 'tests 1' '1..1'
is 'done_testing' '1..1'
is 'tests 2' '1..2'
is 'done_testing' '1..3'
is 'tests 16' '1..16'
is 'done_testing' '1..5'
is 'tests 128' '1..128'
is 'done_testing' '1..7'
is 'tests 4096' '1..4096'
is 'done_testing' '1..9'
