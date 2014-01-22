#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

define([bshtap_ver], esyscmd([./genvers.sh]))

AC_PREREQ([2.59])
AC_INIT([bshtap], bshtap_ver, [kt@wheel.jp])
AM_INIT_AUTOMAKE([foreign dist-xz])
AC_REQUIRE_AUX_FILE([tap-driver.sh])
AC_PROG_AWK

AC_CONFIG_FILES([Makefile
		 bshtap.spec
                 t/Makefile])
AC_OUTPUT
