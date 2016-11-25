PKG_NAME = libmpcdec
PKG_NAME_SRC = musepack_src
PKG_VERS = r475
PKG_EXT = tar.gz
PKG_DIR = musepack_src_$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = https://files.musepack.net/source

DEPENDS = cross/libcuefile cross/libreplaygain

HOMEPAGE = http://musepack.net/
COMMENT  = Musepack SV8 CUE File library
LICENSE  = GNU GPL

GNU_CONFIGURE = 1
CONFIGURE_TARGET = myConfigure

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$(STAGING_INSTALL_PREFIX) -DLIBRARY_OUTPUT_PATH=$(STAGING_INSTALL_PREFIX)/lib

