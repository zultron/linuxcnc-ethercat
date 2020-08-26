include ../config.mk

SUBDIRS = generic-complex swm-fm45a

install-examples:
	mkdir -p $(DESTDIR)$(DATAROOTDIR)/linuxcnc-ethercat/examples
	cp -R $(SUBDIRS) $(DESTDIR)$(DATAROOTDIR)/linuxcnc-ethercat/examples

