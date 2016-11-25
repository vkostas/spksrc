PKG_NAME = libtirpc
PKG_VERS = 1.0.1
PKG_EXT = tar.bz2
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://downloads.sourceforge.net/project/$(PKG_NAME)/$(PKG_NAME)/$(PKG_VERS)

DEPENDS = 

HOMEPAGE = http://nfsv4.bullopensource.org/doc/tirpc_rpcbind.php
COMMENT  = A pre-requisite for the support of IPv6 is to solve the problem of the current SunRPC and portmap which have been designed only for TCP and UDP over IPv4 transports
LICENSE  = 

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --disable-static --disable-gssapi --enable-shared

include ../../mk/spksrc.cross-cc.mk

