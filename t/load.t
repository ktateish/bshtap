#!/bin/sh
# vim:ft=sh:


echo 1..23
echo "# tests before loading"
# test 1
if test "${_BSHTAP_DONE-"not_defined"}" = "not_defined"; then
	echo "ok 1 - _BSHTAP_DONE is not defined before loading"
else
	echo "not ok 1 - _BSHTAP_DONE is defined before loading"
fi

# test 2
if type cmp_ok 2>/dev/null; then
        echo "not ok 2 - 'cmp_ok' is defined as something"
else
        echo "ok 2 - 'cmp_ok' isn't defined"
fi

# test 3
if type diag 2>/dev/null; then
        echo "not ok 3 - 'diag' is defined as something"
else
        echo "ok 3 - 'diag' isn't defined"
fi

# test 4
if type tests 2>/dev/null; then
        echo "not ok 4 - 'tests' is defined as something"
else
        echo "ok 4 - 'tests' isn't defined"
fi

# test 5
if type skip_all 2>/dev/null; then
        echo "not ok 5 - 'skip_all' is defined as something"
else
        echo "ok 5 - 'skip_all' isn't defined"
fi

# test 6
if type done_testing 2>/dev/null; then
        echo "not ok 6 - 'done_testing' is defined as something"
else
        echo "ok 6 - 'done_testing' isn't defined"
fi

# test 7
if type ok 2>/dev/null; then
        echo "not ok 7 - 'ok' is defined as something"
else
        echo "ok 7 - 'ok' isn't defined"
fi

# test 8
if type is 2>/dev/null; then
        echo "not ok 8 - 'is' is defined as something"
else
        echo "ok 8 - 'is' isn't defined"
fi

# test 9
if type isnt 2>/dev/null; then
        echo "not ok 9 - 'isnt' is defined as something"
else
        echo "ok 9 - 'isnt' isn't defined"
fi

# test 10
if type like 2>/dev/null; then
        echo "not ok 10 - 'like' is defined as something"
else
        echo "ok 10 - 'like' isn't defined"
fi

# test 11
if type unlike 2>/dev/null; then
        echo "not ok 11 - 'unlike' is defined as something"
else
        echo "ok 11 - 'unlike' isn't defined"
fi

# load bshtap
echo "# test loading"
if . $(dirname $0)/../bshtap; then
	echo "ok 12 - loading"
else
	echo "not ok 12 - loading"
fi

echo "# tests after loading"
# test 13
if test $_BSHTAP_DONE = 0; then
	echo "ok 13 - _BSHTAP_DONE is 0 after loading"
else
	echo "not ok 13 - _BSHTAP_DONE isn't 0 after loading"
fi

# test 14
if type cmp_ok 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 14 - 'cmp_ok' is defined as a function"
else
	echo "not ok 14 - 'cmp_ok' isn't defined as a function"
fi

# test 15
if type diag 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 15 - 'diag' is defined as a function"
else
	echo "not ok 15 - 'diag' isn't defined as a function"
fi

# test 16
if type tests 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 16 - 'tests' is defined as a function"
else
	echo "not ok 16 - 'tests' isn't defined as a function"
fi

# test 17
if type skip_all 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 17 - 'skip_all' is defined as a function"
else
	echo "not ok 17 - 'skip_all' isn't defined as a function"
fi

# test 18
if type done_testing 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 18 - 'done_testing' is defined as a function"
else
	echo "not ok 18 - 'done_testing' isn't defined as a function"
fi

# test 19
if type ok 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 19 - 'ok' is defined as a function"
else
	echo "not ok 19 - 'ok' isn't defined as a function"
fi

# test 20
if type is 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 20 - 'is' is defined as a function"
else
	echo "not ok 20 - 'is' isn't defined as a function"
fi

# test 21
if type isnt 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 21 - 'isnt' is defined as a function"
else
	echo "not ok 21 - 'isnt' isn't defined as a function"
fi

# test 22
if type like 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 22 - 'like' is defined as a function"
else
	echo "not ok 22 - 'like' isn't defined as a function"
fi

# test 23
if type unlike 2>/dev/null | head -n 1 | grep -q function; then
	echo "ok 23 - 'unlike' is defined as a function"
else
	echo "not ok 23 - 'unlike' isn't defined as a function"
fi
