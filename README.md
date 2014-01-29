bshtap
======

Yet another TAP testing library for Bourne Shell

SYNOPSIS
========
```sh
#!/bin/sh

. /path/to/your_functions.sh	# Load your functions that will be tested.

. /usr/share/bshtap/bshtap	# Load with the full path to the bshtap where
				# you installed.
				# Or set your PATH to the installed directory
				# and just load as '. bshtap'

tests 8				# use tests to set the number of tests

#skip_all "some reason"		# skip_all prints '1..0 # SKIP some reason' and
				# exit immediately

# you can also use 'done_testing' after tests(see below)

diag example tests		# diag for diagnostic messages


# You can use ok, is, isnt, like, unlike, cmp_ok

ok true "test name"		# 'ok' checks the return value of the first
				# argument as command(s)

ok "true foo" "test name #2" 	# Quote the test code when they are more than
				# 2 words. i.e. only the first argument is taken
				# as the test code

ok true				# You can omit the test name.  It prints the
				# first argument as the test name

is "echo foo" "foo"		# Use 'is' to check the output of the first
				# argument

isnt "echo foo" "bar"		# 'isnt' for checking the output of the first
				# argument differ from the second

like "date '+%Y'" "[0-9]{4}"	# Use 'like' to check the output with RE(egrep).

unlike "echo foo" "[0-9]{4}"	# 'unlike' is complementary to 'like'

cmp_ok false -eq 1		# 'cmp_ok' is a generalized 'ok' with test
				# operator.  It tests the return value of the
				# first argument and the third argument with
				# second argument as a test operator.
				# e.g. in this example above, it is checking
				#      -------------------------
				#      false
				#      if [ $? -eq 1 ]; then
				#        echo ok
				#      else
				#        echo not ok
				#      fi
				#      -------------------------

#done_testing			# Use 'done_testing' instead of 'tests' if you
				# don't want to specify the number of tests.
				# It counts the number of ok/is/isnt...etc. and
				# put the 1..N
```

INSTALLATION
============
Place the https://github.com/ktateish/bshtap/raw/master/bshtap script
anywhere you want.

Or do the following
```
git clone http://github.com/ktateish/bshtap.git
cd bshtap
autoreconf -ivh
./configure
make
make install
```
