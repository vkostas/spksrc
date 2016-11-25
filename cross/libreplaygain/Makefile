PKG_NAME = libreplaygain
PKG_VERS = r475
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)_$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = https://files.musepack.net/source

DEPENDS = 

HOMEPAGE = http://musepack.net/
COMMENT  = Musepack SV8 CUE File library
LICENSE  = GNU GPL

GNU_CONFIGURE = 1
CONFIGURE_TARGET = myConfigure
INSTALL_TARGET = install_target myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$(STAGING_INSTALL_PREFIX)

.PHONY: myInstall
myInstall:
	$(RUN) mkdir -p $(STAGING_INSTALL_PREFIX)/include
	$(RUN) cp -r $(WORK_DIR)/$(PKG_DIR)/include/replaygain $(STAGING_INSTALL_PREFIX)/include

