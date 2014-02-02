SUBDIRS = t

pkgdata_SCRIPTS = bshtap

EXTRA_DIST = \
	LICENSE \
	README.md \
	VERSION \
	bshtap \
	bshtap.spec \
	bshtap.spec.in \
	genvers.sh

VERSION:
	(cd $(top_srcdir) ;\
		printf "%s\n" `./genvers.sh` $< > $@.new ;\
		mv -f $@.new $@ ;)

release:
	(rm -f $(top_srcdir)/VERSION ;\
		autoreconf -ifv $(top_srcdir) ;\
		$(MAKE) distcheck ;)


rpm: $(DIST_ARCHIVES)
	rpmbuild -D "%_topdir $$(pwd)/$(top_builddir)/rpmbuild" -ta \
		$(DIST_ARCHIVES) && \
	ln -f   $$(pwd)/$(top_builddir)/rpmbuild/RPMS/*/$(PACKAGE)-*.rpm \
		$$(pwd)/$(top_builddir)/rpmbuild/SRPMS/$(PACKAGE)-*.rpm .

clean-local:
	-rm -rf rpmbuild

sum:
	sha256sum $(PACKAGE)*{.tar.?z,rpm}
