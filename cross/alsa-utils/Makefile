PKG_NAME = alsa-utils
PKG_VERS = 1.1.2
PKG_EXT = tar.bz2
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = ftp://ftp.alsa-project.org/pub/utils

#$(info Checking whether ncurses or ncursesW are installed)
ifneq ("$(wildcard $(INSTALL_DIR)$(INSTALL_PREFIX)/bin/ncursesw*)","")
MY_NCURSESW=w
#$(info NcursesW found ............)
else
#$(info Ncurses  found ............)
endif

DEPENDS = cross/alsa-lib cross/ncurses

HOMEPAGE = http://www.alsa-project.org/
COMMENT  = Advanced Linux Sound Architecture provides audio and MIDI functionality to the Linux operating system
LICENSE  =

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --with-curses=ncurses$(MY_NCURSESW)
INSTALL_TARGET = myInstall
PATCH_TARGET = myPatch patch

include ../../mk/spksrc.cross-cc.mk

.PHONY: myPatch
myPatch:
	$(RUN) sed -i "s:ncurses5:ncurses6:g" configure.ac
	$(RUN) sed -i "s:ncurses5:ncurses6:g" configure
	$(RUN) sed -i "s:ncursesw5:ncursesw6:g" configure.ac
	$(RUN) sed -i "s:ncursesw5:ncursesw6:g" configure

.PHONY: myInstall
myInstall:
	$(RUN) make install DESTDIR=$(INSTALL_DIR)

