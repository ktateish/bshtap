#!/bin/sh
# vim:ft=sh:sw=8

. $(dirname $0)/../bshtap

(
cat << EOM
. $(dirname $0)/common.sh
. $(dirname $0)/../bshtap

EOM

cat << 'EOM'

diag output with diag
diag
diag # without args

diag foo	# one word
diag "foo"	# one quoted word
diag 'foo'	# another quoted word

diag foo bar 		# two word
diag "foo bar" 		# quoted two word
diag 'foo bar'
diag "foo" "bar" 	# two quoted word
diag 'foo' 'bar'

diag $(nword 3 foo) 	# with command substitution
diag "$(nword 3 foo)"
diag '$(nword 3 foo)' 	# should not be substituted

diag `nword 3 foo` 	# another command substitution
diag "`nword 3 foo`"
diag '`nword 3 foo`'

diag $(nline 3 foo) 	# command substitution with newlines
diag "$(nline 3 foo)"	# all lines should be started with '# '

diag output without test name
ok true
is "nword 1 foo" "foo"
isnt "nword 1 foo" "bar"
like "nword 1 foo" "^foo$"
unlike "nword 1 foo" "of"
cmp_ok true -eq 0

diag stdout will be commented out when ok / cmp_ok
ok "nword 1 foo"
cmp_ok "nword 1 foo" -eq 0

( skip_all )
( skip_all some reason )

echo
echo ALL_DONE

EOM
) |sh - > output.out

tests 1
ok "diff -q output.out $(dirname $0)/output.ref" "output check"
