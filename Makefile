DESTDIR       =
PREFIX        = /usr/local
INSTALL       = /usr/bin/env install
bindir        = $(PREFIX)/bin

install:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -m755 arch-sync-packages.sh $(DESTDIR)$(bindir)/arch-sync-packages
