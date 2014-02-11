#!/bin/sh

git checkout master
rel=$(git describe | sed -e 's/^v//; s/-.*//;')

git checkout -b dist-$rel v$rel || exit
autoreconf -if
./configure
git add -f \
	aclocal.m4 \
	bshtap.spec \
	configure \
	install-sh \
	Makefile.in \
	missing \
	t/Makefile.in \
	tap-driver.sh \
	VERSION
git ci -m "Add configure for $rel"
git checkout dist
git branch -D dist.bak >/dev/null 2>&1
git branch dist.bak
git merge --log --no-edit -m "Sync with $rel" -X theirs dist-$rel || exit
git diff dist-$rel || exit
git branch -d dist-$rel dist.bak
