#!/bin/sh
# vim:ft=sh:


printf "1..23\n"
printf "# tests before loading\n"
# test 1
if test "${_BSHTAP_DONE-"not_defined"}" = "not_defined"; then
	printf "ok 1 - _BSHTAP_DONE is not defined before loading\n"
else
	printf "not ok 1 - _BSHTAP_DONE is defined before loading\n"
fi

# test 2
if type cmp_ok > /dev/null 2>&1; then
        printf "not ok 2 - 'cmp_ok' is defined as something\n"
else
        printf "ok 2 - 'cmp_ok' isn't defined\n"
fi

# test 3
if type diag > /dev/null 2>&1; then
        printf "not ok 3 - 'diag' is defined as something\n"
else
        printf "ok 3 - 'diag' isn't defined\n"
fi

# test 4
if type tests > /dev/null 2>&1; then
        printf "not ok 4 - 'tests' is defined as something\n"
else
        printf "ok 4 - 'tests' isn't defined\n"
fi

# test 5
if type skip_all > /dev/null 2>&1; then
        printf "not ok 5 - 'skip_all' is defined as something\n"
else
        printf "ok 5 - 'skip_all' isn't defined\n"
fi

# test 6
if type done_testing > /dev/null 2>&1; then
        printf "not ok 6 - 'done_testing' is defined as something\n"
else
        printf "ok 6 - 'done_testing' isn't defined\n"
fi

# test 7
if type ok > /dev/null 2>&1; then
        printf "not ok 7 - 'ok' is defined as something\n"
else
        printf "ok 7 - 'ok' isn't defined\n"
fi

# test 8
if type is > /dev/null 2>&1; then
        printf "not ok 8 - 'is' is defined as something\n"
else
        printf "ok 8 - 'is' isn't defined\n"
fi

# test 9
if type isnt > /dev/null 2>&1; then
        printf "not ok 9 - 'isnt' is defined as something\n"
else
        printf "ok 9 - 'isnt' isn't defined\n"
fi

# test 10
if type like > /dev/null 2>&1; then
        printf "not ok 10 - 'like' is defined as something\n"
else
        printf "ok 10 - 'like' isn't defined\n"
fi

# test 11
if type unlike > /dev/null 2>&1; then
        printf "not ok 11 - 'unlike' is defined as something\n"
else
        printf "ok 11 - 'unlike' isn't defined\n"
fi

# load bshtap
printf "# test loading\n"
if . $(dirname $0)/../bshtap; then
	printf "ok 12 - loading\n"
else
	printf "not ok 12 - loading\n"
fi

printf "# tests after loading\n"
# test 13
if test $_BSHTAP_DONE = 0; then
	printf "ok 13 - _BSHTAP_DONE is 0 after loading\n"
else
	printf "not ok 13 - _BSHTAP_DONE isn't 0 after loading\n"
fi

# test 14
if type cmp_ok 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 14 - 'cmp_ok' is defined as a function\n"
else
	printf "not ok 14 - 'cmp_ok' isn't defined as a function\n"
fi

# test 15
if type diag 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 15 - 'diag' is defined as a function\n"
else
	printf "not ok 15 - 'diag' isn't defined as a function\n"
fi

# test 16
if type tests 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 16 - 'tests' is defined as a function\n"
else
	printf "not ok 16 - 'tests' isn't defined as a function\n"
fi

# test 17
if type skip_all 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 17 - 'skip_all' is defined as a function\n"
else
	printf "not ok 17 - 'skip_all' isn't defined as a function\n"
fi

# test 18
if type done_testing 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 18 - 'done_testing' is defined as a function\n"
else
	printf "not ok 18 - 'done_testing' isn't defined as a function\n"
fi

# test 19
if type ok 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 19 - 'ok' is defined as a function\n"
else
	printf "not ok 19 - 'ok' isn't defined as a function\n"
fi

# test 20
if type is 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 20 - 'is' is defined as a function\n"
else
	printf "not ok 20 - 'is' isn't defined as a function\n"
fi

# test 21
if type isnt 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 21 - 'isnt' is defined as a function\n"
else
	printf "not ok 21 - 'isnt' isn't defined as a function\n"
fi

# test 22
if type like 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 22 - 'like' is defined as a function\n"
else
	printf "not ok 22 - 'like' isn't defined as a function\n"
fi

# test 23
if type unlike 2>/dev/null | head -n 1 | grep -q function; then
	printf "ok 23 - 'unlike' is defined as a function\n"
else
	printf "not ok 23 - 'unlike' isn't defined as a function\n"
fi
