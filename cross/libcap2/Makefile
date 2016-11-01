PKG_NAME = libcap
PKG_VERS = 2.22
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/

DEPENDS = cross/attr

HOMEPAGE = http://kernel.org/
COMMENT  = 
LICENSE  = 

PATCH_TARGET = myPatch
CONFIGURE_TARGET = nope
INSTALL_TARGET = myInstall
ADDITIONAL_CFLAGS = "-I$(WORK_DIR)/$(PKG_DIR)/libcap/include"
ADDITIONAL_LDFLAGS = "-L$(WORK_DIR)/$(PKG_DIR)/libcap"
ENV += BUILD_CFLAGS="\$$(CFLAGS)" BUILD_CC="cc"

include ../../mk/spksrc.cross-cc.mk

.PHONY: myPatch
myPatch:
	sed -i -e "s/^CC\|^CFLAGS\|^BUILD_CC\|^BUILD_CFLAGS\|^AR\|^RANLIB/#syno-patch#&/g" $(WORK_DIR)/$(PKG_DIR)/Make.Rules
	sed -i -e "s/\(^LIBATTR := \).*$$/\1no/g" $(WORK_DIR)/$(PKG_DIR)/Make.Rules
	sed -i -e "s/\/usr\//$$'(TC_PATH)\/..\//g" $(WORK_DIR)/$(PKG_DIR)/Make.Rules
	sed -i -e "s/'(TC_PATH)/(TC_PATH)/g" $(WORK_DIR)/$(PKG_DIR)/Make.Rules
	sed -i -e "s/^#include <linux\/xattr.h>.*$$/&\n#include <linux\/capability.h>/g" $(WORK_DIR)/$(PKG_DIR)/libcap/cap_file.c
	sed -i -e "/mkdir -p /s/-m [0-9]\+ //g" $(WORK_DIR)/$(PKG_DIR)/libcap/Makefile
	sed -i -e "/mkdir -p /s/-m [0-9]\+ //g" $(WORK_DIR)/$(PKG_DIR)/progs/Makefile
	sed -i -e "/mkdir -p /s/-m [0-9]\+ //g" $(WORK_DIR)/$(PKG_DIR)/pam_cap/Makefile
	sed -i -e "/install /s/-m [0-9]\+ //g" $(WORK_DIR)/$(PKG_DIR)/libcap/Makefile
	sed -i -e "/install /s/-m [0-9]\+ //g" $(WORK_DIR)/$(PKG_DIR)/progs/Makefile
	sed -i -e "/install /s/-m [0-9]\+ //g" $(WORK_DIR)/$(PKG_DIR)/pam_cap/Makefile

.PHONY: myInstall
myInstall:
	$(RUN) $(MAKE) RAISE_SETFCAP=no install DESTDIR=$(INSTALL_DIR) prefix=$(INSTALL_PREFIX) lib_prefix=$(INSTALL_PREFIX)/lib

