PKG_NAME = libsidplayfp
PKG_VERS_MAIN = 1.8
PKG_VERS = $(PKG_VERS_MAIN).6
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = https://sourceforge.net/projects/sidplay-residfp/files/$(PKG_NAME)/$(PKG_VERS_MAIN)

DEPENDS = 

HOMEPAGE = http://sidplay2.sourceforge.net
COMMENT  = Capable of playing all C64 mono and stereo file formats
LICENSE  =

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --enable-shared

include ../../mk/spksrc.cross-cc.mk

