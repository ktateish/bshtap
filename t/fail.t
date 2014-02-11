#!/bin/sh
# vim:ft=sh:

. $(dirname $0)/../bshtap

# These tests ensure that Invalid invoking will fail.

printf "1..12\n"
exec 3>&1 1>&2

printf3 () {
	printf "$@" >&3
}

( ok ) && printf3 "not "
printf3 "ok - ok without arguments\n"

(cmp_ok) && printf3 "not "
printf3 "ok - cmp_ok without arguments\n"

(cmp_ok true) && printf3 "not "
printf3 "ok - cmp_ok without expected operator\n"

(cmp_ok true -eq) && printf3 "not "
printf3 "ok - cmp_ok without expected result\n"

(is) && printf3 "not "
printf3 "ok - is without arguments\n"

(is "printf 'foo\n'") && printf3 "not "
printf3 "ok - is without expected result\n"

(isnt) && printf3 "not "
printf3 "ok - isnt without arguments\n"

(isnt "printf 'foo\n'") && printf3 "not "
printf3 "ok - isnt without expected result\n"

(like) && printf3 "not "
printf3 "ok - like without arguments\n"

(like "printf 'foo\n'") && printf3 "not "
printf3 "ok - like without regex\n"

(unlike) && printf3 "not "
printf3 "ok - unlike without arguments\n"

(unlike "printf 'foo\n'") && printf3 "not "
printf3 "ok - unlike without regex\n"
