PKG_NAME = libvorbis
PKG_VERS = 1.3.5
PKG_EXT = tar.xz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://downloads.xiph.org/releases/vorbis
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libogg

HOMEPAGE = http://www.vorbis.com/
COMMENT  = Free, open container format
LICENSE  = BSD
INSTALL_TARGET = myInstall
#CONFIGURE_ARGS = --prefix=$(STAGING_INSTALL_PREFIX)

GNU_CONFIGURE = 1

include ../../mk/spksrc.cross-cc.mk

.PHONY: myInstall
myInstall:
	$(RUN) $(MAKE) install DESTDIR=$(INSTALL_DIR)
#prefix=$(INSTALL_PREFIX)
