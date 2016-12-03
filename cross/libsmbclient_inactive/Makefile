PKG_NAME = libsmbclient
PKG_VERS = 3.6.8
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = ftp://ftp.samba.org/pub/samba/stable

DEPENDS = cross/libtirpc cross/gnutls cross/sqlite #cross/python

HOMEPAGE = http://www.samba.org
COMMENT  = File and print services to SMB/CIFS clients and Windows networking to Linux clients
LICENSE  =

GNU_CONFIGURE = 1
CONFIGURE_ARGS = --without-systemd --enable-fhs --with-piddir=$(STAGING_INSTALL_PREFIX)/run/samba --cross-compile --hostcc=$(TC_TARGET) --cross-answers=spksrc_samba.txt

PATCH_TARGET = patch_target myPatch
#CONFIGURE_TARGET = myConfigure
#INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

myPatch:
	sed -i "s/-ldl/& -ltirpc -lpthread/g" $(WORK_DIR)/$(PKG_DIR)/Makefile
#	sed -i "s/\(^ *conf.find_program('gdb', mandatory=True\)) *$$/\1, var='GDB')/g" $(WORK_DIR)/$(PKG_DIR)/buildtools/wafsamba/wscript
#	sed -ie "s/\(^ *headers=\)\('sys\/utsname.h',\)/\1[\2'stdio.h'],/g" $(WORK_DIR)/$(PKG_DIR)/buildtools/wafsamba/samba_conftests.py
#	mkdir -p $(STAGING_INSTALL_PREFIX)/include/sys
#	cp $(TC_PATH)/../$(TC_TARGET)/libc/usr/include/stdio.h $(STAGING_INSTALL_PREFIX)/include/
#	cp $(TC_PATH)/../$(TC_TARGET)/libc/usr/include/sys/utsname.h $(STAGING_INSTALL_PREFIX)/include/sys/

.PHONY: myConfigure
myConfigure:
	$(RUN) ./buildtools/bin/waf configure $(CONFIGURE_ARGS)
#	cd $(WORK_DIR)/$(PKG_DIR) && env PATH=$(TC_PATH):$(PATH) ./buildtools/bin/waf configure $(CONFIGURE_ARGS)

.PHONY: myInstall
myInstall:
	$(RUN) make install DESTDIR=$(INSTALL_DIR)

