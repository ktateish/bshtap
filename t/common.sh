#!/bin/sh
# vim:ft=sh:

nword () {
	local word n i
	n=$1
	word=$2
	i=1

	printf "%s" $word
	while test $i -lt $n
	do
		printf "%s" " $word"
		i=$(($i + 1))
	done
	printf "\n"
}

nline () {
	local word n i
	n=$1
	word=$2
	i=1

	while test $i -le $n
	do
		printf "%s\n" $word
		i=$(($i + 1))
	done
}
