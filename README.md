bshtap(7)
=========

NAME
----
bshtap - Yet another TAP testing library for Bourne Shell

SYNOPSIS
--------
```sh
. /path/to/bshtap
tests <n>
skip_all [<reason>]
diag <message>
ok <command> [<test name>]
is <command> <expected> [<test name>]
isnt <command> <unexpected> [<test name>]
like <command> <expected regex> [<test name>]
unlike <command> <unexpected regex> [<test name>]
cmp_ok <command> <op> <expected> [<test name>]
skip [<reason>] [<n>]
piks
todo [<reason>]
odot
done_testing [<n>]
```

DESCRIPTION
-----------
The bshtap is a TAP compliant /bin/sh library for test.  It has simple
interface like Perl Test::More and works on some platforms.
It can be used to test not only for /bin/sh functions but also for Unix commands.

EXAMPLES
--------
```sh
#!/bin/sh

. /path/to/your_functions.sh    # Load your functions that will be tested.
                                # Of course you can use bshtap for testing
                                # your commands installed in your PATH without
                                # loading any functions.

. /usr/share/bshtap/bshtap      # Load with the full path to the bshtap where
                                # you installed.
                                # Or set your PATH to the installed directory
                                # and just load as '. bshtap'

tests 13                        # use tests to set the number of tests

#skip_all "some reason"         # skip_all prints '1..0 # SKIP some reason' and
                                # exit immediately

# you can also use 'done_testing' after tests(see below)

diag example tests              # diag for diagnostic messages


# You can use ok, is, isnt, like, unlike, cmp_ok

ok true "test name"             # 'ok' checks the return value of the first
                                # argument as command(s)

ok "true foo" "test name #2"    # Quote the test code when they are more than
                                # 2 words. i.e. only the first argument is taken
                                # as the test code

ok true                                # You can omit the test name.  It prints the
                                # first argument as the test name

is "echo foo" "foo"             # Use 'is' to check the output of the first
                                # argument

isnt "echo foo" "bar"           # 'isnt' for checking the output of the first
                                # argument differ from the second

like "date '+%Y'" "[0-9]{4}"    # Use 'like' to check the output with RE(egrep).

unlike "echo foo" "[0-9]{4}"    # 'unlike' is complementary to 'like'

cmp_ok false -eq 1              # 'cmp_ok' is a generalized 'ok' with test
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

skip "not implemented" 3        # 'skip' skips following tests avoiding to
        ok broken_func1         # invoke test commands until 'piks' invoked.
        ok broken_func2         # Actually, the 'skip' prints out
        ok broken_func3         #   'ok <n> # skip ...'
piks                                # lines immediately and following bshtap
                                # functions (e.g. ok, is, ...) are invoked and
                                # just return soon.
                                #
                                # Note that it means normal commands will be
                                # invoked as usual even if they are in 'skip'
                                # ... 'piks' context.

todo "we need this"             # 'todo' prints out ' # TODO ...' messages
        ok another_func1        # after each test output until 'otod' invoked.
        ok another_func2
odot

#done_testing                   # Use 'done_testing' instead of 'tests' if you
                                # don't want to specify the number of tests.
                                # It counts the number of ok/is/isnt...etc. and
                                # put the 1..N
```

INSTALLATION
------------
Place the https://github.com/ktateish/bshtap/raw/master/bshtap script
anywhere you want.

Or download tarball from https://github.com/ktateish/bshtap/tarball/dist/
and do the following:
```
tar xvf ktateish-bshtap-<version>.tar.gz
cd ktateish-bshtap-<version>
./configure
make                            # or gmake
make install
```

TESTED PLATFORMS
----------------
* Linux (bash, dash)
* FreeBSD 9.x
* NetBSD 6.1.3
* OpenBSD 5.4
* MacOS X Marvericks
