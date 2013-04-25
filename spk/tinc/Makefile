SPK_NAME = tinc
SPK_VERS = 1.0.20
SPK_REV = 1
SPK_ICON = src/tinc.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = SynoCommunity
DESCRIPTION = Tinc is a Virtual Private Network \(VPN\) daemon that uses tunnelling and encryption to create a secure private network between hosts on the Internet.
RELOAD_UI = no
DISPLAY_NAME = tinc
STARTABLE = no

HOMEPAGE   = http://www.tinc-vpn.org/
LICENSE    = GPL

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
ADDITIONAL_SCRIPTS = 

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

include ../../mk/spksrc.spk.mk
