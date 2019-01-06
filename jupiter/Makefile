package = jupiter
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)


sources=bar.c

all clean jupiter:
	cd src && ${MAKE} $@


test:
	@echo ${sources}

dist: $(distdir).tar.gz

$(distdir).tar.gz: $(distdir)
	tar chof - $(distdir) | gzip -9 -c >$@
	rm -rf $(distdir)

$(distdir):FORCE
	mkdir -p $(distdir)/src
	cp Makefile $(distdir)
	cp src/Makefile $(distdir)/src
	cp src/main.c $(distdir)/src

FORCE:
	-rm $(distdir).tar.gz > /dev/null 2>&1
	-rm -rf $(distdir) > /dev/null 2>&1

.PHONY: all clean test dist  FORCE



