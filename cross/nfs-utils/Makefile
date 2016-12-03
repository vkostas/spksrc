PKG_NAME_MAIN = nfs
PKG_NAME = $(PKG_NAME_MAIN)-utils
PKG_VERS = 1.3.3
PKG_EXT = tar.bz2
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://downloads.sourceforge.net/$(PKG_NAME_MAIN)/files

DEPENDS = cross/util-linux cross/libtirpc cross/libevent cross/sqlite cross/libnfsidmap cross/tcp_wrappers

HOMEPAGE = http://nfs.sourceforge.net/
COMMENT  = Userspace server and client tools necessary to use the kernel\'s NFS abilities
LICENSE  = 

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --disable-static --disable-nfsv4 --disable-gss --without-tcp-wrappers --disable-gss
INSTALL_TARGET = myInstall
PATCH_TARGET = myPatch

include ../../mk/spksrc.cross-cc.mk

.PHONY: myPatch
myPatch:
#	Fix variables ending with _FOR_BUILD-"" or _FOR_BUILD-gcc
	sed -i -e 's/_FOR_BUILD-""\|_FOR_BUILD-gcc//g' $(WORK_DIR)/$(PKG_DIR)/configure $(WORK_DIR)/$(PKG_DIR)/configure.ac

.PHONY: myInstall
myInstall:
	$(RUN) make install DESTDIR=$(STAGING_INSTALL_PREFIX) prefix=
