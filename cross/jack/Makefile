PKG_NAME = jack
PKG_VERS = 0.125.0
PKG_EXT = tar.gz
PKG_DIR = jack-audio-connection-kit-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://jackaudio.org/downloads

DEPENDS = cross/berkeleydb cross/libuuid cross/libsamplerate cross/alsa-lib cross/libsndfile

HOMEPAGE = http:/jackaudio.org/
COMMENT  = Audio connection kit (1)
LICENSE  =

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --enable-force-install --libdir=$(STAGING_INSTALL_PREFIX)/lib

include ../../mk/spksrc.cross-cc.mk

