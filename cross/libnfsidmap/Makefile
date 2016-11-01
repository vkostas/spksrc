PKG_NAME = libnfsidmap
PKG_VERS = 0.26
PKG_EXT = tar.bz2
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = https://fedorapeople.org/~steved/$(PKG_NAME)/$(PKG_VERS)

DEPENDS = 

HOMEPAGE = http://www.linuxfromscratch.org/blfs/view/systemd/general/libnfsidmap.html
COMMENT  = Library to help mapping id\'s, mainly for NFSv4
LICENSE  = 

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --disable-static

include ../../mk/spksrc.cross-cc.mk

