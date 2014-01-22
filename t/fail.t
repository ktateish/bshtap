#!/bin/sh
# vim:ft=sh:

. $(dirname $0)/../bshtap

# These tests ensure that Invalid invoking will fail.

echo 1..12
exec 3>&1 1>&2

echo3 () {
	echo "$@" >&3
}

( ok ) && echo3 -n "not "
echo3 ok - ok without arguments

(cmp_ok) && echo3 -n "not "
echo3 ok - cmp_ok without arguments

(cmp_ok true) && echo3 -n "not "
echo3 ok - cmp_ok without expected operator

(cmp_ok true -eq) && echo3 -n "not "
echo3 ok - cmp_ok without expected result

(is) && echo3 -n "not "
echo3 ok - is without arguments

(is "echo foo") && echo3 -n "not "
echo3 ok - is without expected result

(isnt) && echo3 -n "not "
echo3 ok - isnt without arguments

(isnt "echo foo") && echo3 -n "not "
echo3 ok - isnt without expected result

(like) && echo3 -n "not "
echo3 ok - like without arguments

(like "echo foo") && echo3 -n "not "
echo3 ok - like without regex

(unlike) && echo3 -n "not "
echo3 ok - unlike without arguments

(unlike "echo foo") && echo3 -n "not "
echo3 ok - unlike without regex
