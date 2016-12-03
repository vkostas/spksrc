PKG_NAME = cdrtools
PKG_VERS = 2.01
PKG_EXT = tar.bz2
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://gd.tuwien.ac.at/utils/schilling/$(PKG_NAME)

DEPENDS = 

HOMEPAGE = http://gd.tuwien.ac.at/utils/schilling/cdrtools/
COMMENT  = CD recording utilities
LICENSE  = 

#GNU_CONFIGURE = 1
CONFIGURE_TARGET = none
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

ENV += DEFCCOM=$(cc)

.PHONY myInstall:
myInstall:
	$(RUN) make install DESTDIR=$(INSTALL_DIR)

