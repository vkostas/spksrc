PKG_NAME = tinc
PKG_VERS = 1.0.20
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://www.tinc-vpn.org/packages
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/openssl cross/zlib cross/lzo

HOMEPAGE = http://www.tinc-vpn.org/
COMMENT  = tinc is a Virtual Private Network (VPN) daemon that uses tunnelling and encryption to create a secure private network between hosts on the Internet.
LICENSE  = GPL

GNU_CONFIGURE = 1

include ../../mk/spksrc.cross-cc.mk
