PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

install:
	mkdir -p $(BINDIR)
	mkdir -p $(MANDIR)/man1
	install -m 755 sopen $(BINDIR)/
	install -m 644 sopen.1 $(MANDIR)/man1/

uninstall:
	rm -f $(BINDIR)/sopen
	rm -f $(MANDIR)/man1/sopen.1
