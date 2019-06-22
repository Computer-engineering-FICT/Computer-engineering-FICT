BUILT_SOURCES = dummy.html

dummy.html: Doxyfile
	cd ..; $(DOXYGEN) doc/Doxyfile
	rm -f dummy.html
	cp tmp/html/index.html dummy.html

doc: rm_dummy_target dummy.html

rm_dummy_target:
	rm -f dummy.html

EXTRA_DIST = Doxyfile *.dox

CLEANFILES = dummy.html tmp/*

