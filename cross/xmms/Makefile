PKG_NAME = xmms
PKG_VERS_SHORT = 1.2
PKG_VERS = $(PKG_VERS_SHORT).11
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://www.xmms.org/files/$(PKG_VERS_SHORT).x

DEPENDS = cross/glib

HOMEPAGE = http:/www.xmms.org
COMMENT  = Audio player for the X Window System
LICENSE  =

GNU_CONFIGURE = 1

#CONFIGURE_ARGS = --alsa
#CONFIGURE_TARGET = myConfigure
#COMPILE_TARGET = myCompile
#INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

#.PHONY: myConfigure
#myConfigure:
#	$(RUN) ./waf configure

#.PHONY: myCompile
#myCompile:
#	$(RUN) ./waf build

#.PHONY: myInstall
#myInstall:
#	$(RUN) ./waf install

