SPK_NAME = mpd
SPK_VERS = 0.19.19
SPK_REV = 1
SPK_ICON = src/mpd.png
#DSM_UI_DIR = app
BETA = 1

DEPENDS = cross/busybox cross/$(SPK_NAME)
DEPENDS_PLIST_EXCLUDE = cross/boost cross/ncurses

MAINTAINER = vkostas
DESCRIPTION = "Music Player Daemon (MPD) is a flexible, powerful, server-side application for playing music. Through plugins and libraries it can play a variety of sound files while being controlled by its network protocol"
RELOAD_UI = yes
DISPLAY_NAME = MPD
CHANGELOG = "Initial release"
HOMEPAGE = http://www.musicpd.org
LICENSE  = GPLv2/GPLv3

#WIZARDS_DIR = src/wizard/

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
FWPORTS          = src/$(SPK_NAME).sc

INSTALL_DEP_SERVICES = apache-web
START_DEP_SERVICES = apache-web
INSTUNINST_RESTART_SERVICES = apache-web

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = post_strip_target mpd_extra_install
PRE_STRIP_TARGET = pre_strip_target mpd_pre_copy_target

BUSYBOX_CONFIG = usrmng nice daemon
ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

include ../../mk/spksrc.spk.mk

.PHONY: mpd_extra_install
mpd_extra_install:
	install -m 755 -d $(STAGING_DIR)/var
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	install -m 755 -d $(STAGING_DIR)/app/images
	for size in 16 24 32 48 72 ; \
	do \
	    convert $(SPK_ICON) -thumbnail $${size}x$${size} \
	            $(STAGING_DIR)/app/images/$(SPK_NAME)-$${size}.png ; \
	done

.PHONY: mpd_pre_copy_target
mpd_pre_copy_target:
	@echo "Remove Boost, nCurses from PLIST"
	for depend in $(DEPENDS_PLIST_EXCLUDE) ; \
	do \
	  sort ../../$${depend}/PLIST > $(INSTALL_PLIST)tmp ; \
	  comm -2 -3 $(INSTALL_PLIST) $(INSTALL_PLIST)tmp > $(INSTALL_PLIST) ; \
	  rm $(INSTALL_PLIST)tmp ; \
	done ;
	@echo "END Remove"
