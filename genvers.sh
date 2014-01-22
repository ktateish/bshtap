#!/bin/sh
#
# Copyright (c) 2010,2014 Katsuyuki TATEISHI <kt@wheel.jp>
# All rights reserved.
#
# This file is free software; the author gives unlimited permission to copy
# and/or distribute it, with or without modifications, as long as this notice
# is preserved.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY, to the extent permitted by law; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#
# NAME
# 	genvers.sh
#
# SYNOPSIS
#	genvers.sh [_file_]
#
# DESCRIPTION
#	genvers.sh is a script to generate a version number from the result of
#	"git describe" and output to stdout and the _file_.  If _file_ is not
#	given, 'VERSION' is used instead.
#
#	This script requires git command and the project managed with git.  It
#	also requires that the project already have at least one annotation tag
#	to run this script properly.  If the 'VERSION' file is already existed,
#	it works even in non-git managed environment(ex. released tarball
#	user's environment).
#
# EXAMPLES
#	To generate version number automatically when autoreconf -if, put the
#	following code into your configure.ac:
#	----------------------------------------------------------------
#	define([foobar_ver], esyscmd([./genvers.sh]))
#
#	AC_PREREQ([2.xx])
#	AC_INIT([foobar], foobar_ver, [you@example.org])
#	----------------------------------------------------------------
#
#	And to use generated version number for "make distcheck", put the
#	following code into your Makefile.am on $(top_srcdir):
#	----------------------------------------------------------------
#	EXTRA_DIST = VERSION genvers.sh
#
#	VERSION:
#		(cd $(top_srcdir) ;\
#			echo `./genvers.sh` $< > $@.new ;\
#			mv -f $@.new $@ ;)
#
#	release:
#		(rm -f $(top_srcdir)/VERSION ;\
#			autoreconf -ifv $(top_srcdir) ;\
#			$(MAKE) distcheck ;)
#	----------------------------------------------------------------
#	Be sure to do "autoreconf -if" before "make distcheck".
#
#	You can make a new release archive with the new version number:
#
#	% git tag -a 1.0.0 -m "Release 1.0.0"
#	% autoreconf -if
#	% make distcheck
#
#	Then, you'll see the new release file as "foobar-1.0.0.tar.gz".
#	(Of course you must make 'make distcheck' worked before this step.)
#

if test -n "$1"; then
	VERSION_FILE=$1
else
	VERSION_FILE=VERSION
fi

if test -f $VERSION_FILE; then
	VERSION=`cat $VERSION_FILE`
fi

DESC=`git describe 2>/dev/null | grep '^v[0-9]*' | sed -e 's/^v//; s/-/./g;'`
if test -z "$DESC"; then
	# You must be an user
	if test -n "$VERSION"; then
		echo -n $VERSION
	else
		echo -n noversionfound
		echo " Maybe $VERSION_FILE is missing" >&2
	fi
	exit 0
fi

# dirty check
if git status |grep -qE '^# Change'; then
	DIRTY=".dirty"
fi

VERSION_NEW=$DESC$DIRTY
if test "x$VERSION" != "x$VERSION_NEW"; then
	VERSION=$VERSION_NEW
	echo $VERSION > $VERSION_FILE.new
	mv $VERSION_FILE.new $VERSION_FILE
fi

echo -n $VERSION
