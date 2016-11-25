PKG_NAME = alsa-utils
PKG_VERS = 1.1.2
PKG_EXT = tar.bz2
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = ftp://ftp.alsa-project.org/pub/utils

DEPENDS = cross/alsa-lib cross/ncurses

HOMEPAGE = http://www.alsa-project.org/
COMMENT  = Advanced Linux Sound Architecture provides audio and MIDI functionality to the Linux operating system
LICENSE  =

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --disable-alsaconf --disable-bat --disable-xmlto
INSTALL_TARGET = myInstall
PATCH_TARGET = myPatch patch

include ../../mk/spksrc.cross-cc.mk

.PHONY: myPatch
myPatch:
	$(RUN) sed -i -e "s:\(ncurses[w]\)*5:\16:g" configure configure.ac

.PHONY: myInstall
myInstall:
	$(RUN) make install DESTDIR=$(INSTALL_DIR)

