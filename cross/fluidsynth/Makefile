PKG_NAME = fluidsynth
PKG_VERS = 1.1.6
PKG_EXT = tar.bz2
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://sourceforge.net/projects/$(PKG_NAME)/files/$(PKG_DIR)

DEPENDS  = cross/libtool cross/ncurses cross/glib cross/avahi 
DEPENDS += cross/pulseaudio
DEPENDS += cross/libsndfile cross/alsa-lib cross/jack cross/dbus

HOMEPAGE = http://fluidsynth.org
COMMENT  = Real-time software synthesizer based on the SoundFont 2 specifications
LICENSE  =

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --disable-static --prefix=$(STAGING_INSTALL_PREFIX)

include ../../mk/spksrc.cross-cc.mk

