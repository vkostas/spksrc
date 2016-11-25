PKG_NAME = roaraudio
PKG_VERS = 1.0beta12-pr0
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://roaraudio.keep-cool.org/dl

# Optional packages. Can be removed
DEPENDS  = cross/libao cross/libogg cross/libvorbis cross/speex cross/speexdsp cross/libsndfile
DEPENDS += cross/flac cross/libsamplerate cross/icecast cross/libbinio
DEPENDS += cross/alsa-lib cross/alsa-oss cross/zlib

HOMEPAGE = http://roaraudio.keep-cool.org
COMMENT  = Modern, multi-OS, networked Sound System
LICENSE  = 

GNU_CONFIGURE = 1

include ../../mk/spksrc.common.mk

CONFIGURE_ARGS = --cross-compile
ENV += DESTDIR=$(STAGING_INSTALL_PREFIX)/../../
PATCH_TARGET = myPatch patch_target
#INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myPatch
myPatch:
#	Disable pulseaudio plugin (unset subdir_libroarpulse)
	sed -i 's/^COMP_LIB=/subdir_libroarpulse=\n&/g' $(WORK_DIR)/$(PKG_DIR)/Makefile
#	Fix FLAC plugin
	sed -i 's/^#ifndef \(ROAR_HAVE_FLAC_VERSION_1_2_1\)/#define \1\n&/g' $(WORK_DIR)/$(PKG_DIR)/roard/codecfilter_flac.c

.PHONY: myInstall
myInstall:
	$(RUN) $(MAKE) install DESTDIR=$(STAGING_INSTALL_PREFIX)/../../
