TEST_EXTENSIONS = .t
T_LOG_DRIVER = env AM_TAP_AWK='$(AWK)' $(SHELL) \
	$(top_srcdir)/tap-driver.sh

TESTS = \
	cmp_ok.t \
	fail.t \
	load.t \
	ok.t \
	output.t

EXTRA_DIST = \
	     common.sh \
	     output.ref \
	     $(TESTS)

CLEANFILES= output.out
