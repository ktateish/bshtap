#!/bin/sh
# vim:ft=sh:

nword () {
	local word n i
	n=$1
	word=$2
	i=1

	echo -n $word
	while test $i -lt $n
	do
		echo -n " $word"
		i=$(expr $i + 1)
	done
	echo
}

nline () {
	local word n i
	n=$1
	word=$2
	i=1

	while test $i -le $n
	do
		echo $word
		i=$(expr $i + 1)
	done
}
