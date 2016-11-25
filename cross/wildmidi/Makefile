PKG_NAME = wildmidi
PKG_VERS = 0.3.10
PKG_EXT = tar.gz
PKG_DIR = $(PKG_NAME)-$(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://sourceforge.net/projects/$(PKG_NAME)/files/source/

DEPENDS = cross/alsa-utils cross/openal

HOMEPAGE = http://www.mindwerks.net/projects/wildmidi/
COMMENT  = Simple software midi player which has a core software synthesizer (softsynth) library that can be use with other applications.
LICENSE  = 

GNU_CONFIGURE = 1
CONFIGURE_TARGET = myConfigure

CMAKE_ARGS  = -DCMAKE_INSTALL_PREFIX=$(STAGING_INSTALL_PREFIX)
CMAKE_ARGS += -DEXTRA_LINK_FLAGS="-ldl"
CMAKE_ARGS += -DCMAKE_CROSSCOMPILING=TRUE
CMAKE_ARGS += -DCMAKE_SYSTEM_NAME=Linux
CMAKE_ARGS += -DCMAKE_C_COMPILER=$(TC_PATH)$(TC_PREFIX)gcc
CMAKE_ARGS += -DCMAKE_CXX_COMPILER=$(TC_PATH)$(TC_PREFIX)g++
CMAKE_ARGS += -DBUILD_SHARED_LIBS=ON -DWANT_STATIC=OFF
CMAKE_ARGS += -DM_LIBRARY=$(STAGING_INSTALL_PREFIX)/lib

include ../../mk/spksrc.cross-cc.mk

ifeq ($(findstring $(ARCH), $(ARM5_ARCHES)),$(ARCH))
CMAKE_ARGS += -DCMAKE_SYSTEM_PROCESSOR=armv5
endif

ifeq ($(findstring $(ARCH), $(ARM7_ARCHES)),$(ARCH))
CMAKE_ARGS += -DCMAKE_CXX_FLAGS=-fPIC
CMAKE_ARGS += -DCMAKE_SYSTEM_PROCESSOR=armv7
endif

ifeq ($(findstring $(ARCH), $(PPC_ARCHES)),$(ARCH))
CMAKE_ARGS += -DCMAKE_SYSTEM_PROCESSOR=ppc64
endif

ifeq ($(findstring $(ARCH), $(x64_ARCHES)),$(ARCH))
DEPENDS += native/yasm cross/libnuma
ENV += PATH=$(YASM_PATH):$$PATH
CMAKE_ARGS += -DCMAKE_SYSTEM_PROCESSOR=x86_64
endif

ifeq ($(findstring $(ARCH), $(x86_ARCHES)),$(ARCH))
DEPENDS += native/yasm cross/libnuma
ENV += PATH=$(YASM_PATH):$$PATH
CMAKE_ARGS += -DCMAKE_SYSTEM_PROCESSOR=x86
endif

# For ppc853x-4.3, disable atomics
ifeq ($(ARCH)-$(TCVERSION), ppc853x-4.3)
CMAKE_ARGS += -DNO_ATOMICS=ON
CMAKE_ARGS += -DCMAKE_CXX_FLAGS="-DSPKSRC_FIX_PPC853X_4_3"
endif

.PHONY: myConfigure
myConfigure:
	$(RUN) cmake $(CMAKE_ARGS) .

