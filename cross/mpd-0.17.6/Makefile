include ../../mk/spksrc.common.mk
PKG_NAME = mpd
PKG_VERS_SHORT = 0.17
PKG_VERS = $(PKG_VERS_SHORT).6
PKG_EXT = tar.xz

PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
PKG_DIST_NAME = $(PKG_DIR).$(PKG_EXT)
PKG_DIST_SITE = http://www.musicpd.org/download/$(PKG_NAME)/$(PKG_VERS_SHORT)

DEPENDS  :=
# 1. Dependencies
DEPENDS  += cross/ncurses                          cross/glib              cross/boost

# 2. Optional output dependencies
DEPENDS += cross/fluidsynth
DEPENDS += cross/libao         cross/alsa-lib      cross/pulseaudio        cross/jack
DEPENDS += cross/libvorbis     cross/lame          cross/icecast           cross/libshout
DEPENDS += cross/openal        cross/alsa-oss      cross/alsa-utils

# 3. Optional Input Dependencies
DEPENDS += cross/libid3tag     cross/libmad        cross/mpg123            cross/libogg
DEPENDS += cross/opus          cross/flac          cross/audiofile         cross/faad2
DEPENDS += cross/libmikmod
DEPENDS += cross/ffmpeg-2.2.1
DEPENDS += cross/libsndfile    cross/libwavpack                            cross/libmpcdec
DEPENDS += cross/sidplay2-libs cross/libsidplayfp  cross/wildmidi          cross/fluidsynth

# 4. Optional Miscellaneous Dependencies
DEPENDS += cross/avahi         cross/libsamplerate cross/curl              cross/libmms
DEPENDS += cross/sqlite                            cross/libcdio                            
DEPENDS += cross/libcdio-paranoia

# 5. Optional Miscellaneous Dependencies (from make)
DEPENDS += cross/tcp_wrappers                      cross/bzip2             cross/zziplib
DEPENDS += cross/libmpdclient  cross/libmodplug    cross/twolame                           
DEPENDS += cross/roaraudio

HOMEPAGE = http://www.musicpd.org/
COMMENT  = Flexible, powerful, server-side application for playing music
LICENSE  =

GNU_CONFIGURE = 1
CONFIGURE_ARGS  =
CONFIGURE_ARGS += --enable-alsa#                   #enable ALSA support
CONFIGURE_ARGS += --enable-roar#                   #enable support for RoarAudio
CONFIGURE_ARGS += --enable-ao#                     #enable support for libao
CONFIGURE_ARGS += --enable-audiofile#              #enable audiofile support (WAV and others)
CONFIGURE_ARGS += --enable-bzip2#                  #enable bzip2 archive support (default: auto)
CONFIGURE_ARGS += --enable-cdio-paranoia#          #enable support for audio CD support
CONFIGURE_ARGS += --enable-curl#                   #enable support for libcurl HTTP streaming (default: auto)
CONFIGURE_ARGS += --disable-documentation#         #build documentation (default: disable)                              ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-ffmpeg#                 #enable FFMPEG support
CONFIGURE_ARGS += --enable-fifo#                   #disable support for writing audio to a FIFO (default: enable)
CONFIGURE_ARGS += --enable-flac#                   #enable FLAC decoder
CONFIGURE_ARGS += --enable-fluidsynth#             #enable MIDI support via fluidsynth (default: auto)
CONFIGURE_ARGS += --disable-gme#                   #enable Blargg's game music emulator plugin                          ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-httpd-output#           #enables the HTTP server output
CONFIGURE_ARGS += --enable-id3#                    #enable id3 support
CONFIGURE_ARGS += --enable-inotify#                #disable support Inotify automatic database update (default: enabled)
CONFIGURE_ARGS += --enable-ipv6#                   #disable IPv6 support (default: enable)
CONFIGURE_ARGS += --enable-iso9660#                #enable iso9660 archive support (default: disabled)
CONFIGURE_ARGS += --enable-jack#                   #enable jack support
CONFIGURE_ARGS += --enable-largefile#              #omit support for large files
CONFIGURE_ARGS += --disable-soundcloud#            #enable support for soundcloud.com                                   ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-lame-encoder#           #enable the LAME mp3 encoder
CONFIGURE_ARGS += --enable-libwrap#                #use libwrap
CONFIGURE_ARGS += --enable-lsr#                    #enable libsamplerate support
CONFIGURE_ARGS += --enable-mad#                    #enable libmad mp3 decoder plugin
CONFIGURE_ARGS += --enable-mikmod#                 #enable the mikmod decoder (default: disable)
CONFIGURE_ARGS += --enable-mms#                    #enable the MMS protocol with libmms
CONFIGURE_ARGS += --enable-modplug#                #enable modplug decoder plugin 
CONFIGURE_ARGS += --enable-mpc#                    #disable musepack (MPC) support (default: auto)                      ■■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-mpg123#                 #enable libmpg123 decoder plugin
CONFIGURE_ARGS += --enable-openal#                 #enable OpenAL support (default: auto)
CONFIGURE_ARGS += --enable-oss#                    #disable OSS support (default: enable)
CONFIGURE_ARGS += --disable-pipe-output#           #enable support for writing audio to a pipe (default: disable)       ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-pulse#                  #enable support for the PulseAudio sound server
CONFIGURE_ARGS += --disable-recorder-output#       #enables the recorder file output plugin (default: disable)          ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-sidplay#                #enable C64 SID support via libsidplay2
CONFIGURE_ARGS += --enable-shout#                  #enables the shoutcast streaming output
CONFIGURE_ARGS += --enable-sndfile#                #enable sndfile support
CONFIGURE_ARGS += --disable-solaris-output#        #enables the Solaris /dev/audio output                               ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-sqlite#                 #enable support for the SQLite database
CONFIGURE_ARGS += --enable-systemd-daemon=auto#    #use the systemd daemon library (default=auto)                       $$$$$$$$$$$$$$$$$$
CONFIGURE_ARGS += --enable-tcp#                    #disable support for clients connecting via TCP (default: enable)    ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --disable-test#                  #build the test programs (default: disabled)
CONFIGURE_ARGS += --enable-twolame-encoder#        #enable the TwoLAME mp2 encoder
CONFIGURE_ARGS += --enable-un#                     #disable support for clients connecting via unix domain sockets (default: enable)
CONFIGURE_ARGS += --enable-vorbis#                 #enable Ogg Vorbis decoder
CONFIGURE_ARGS += --enable-vorbis-encoder#         #enable the Ogg Vorbis encoder
CONFIGURE_ARGS += --enable-wave-encoder#           #enable the PCM wave encoder
CONFIGURE_ARGS += --enable-wavpack#                #enable WavPack support
CONFIGURE_ARGS += --disable-werror#                #treat warnings as errors (default: disabled)                        ■■■■■■■■■■■■■■■■■■
CONFIGURE_ARGS += --enable-wildmidi#               #enable MIDI support via wildmidi (default: auto)
CONFIGURE_ARGS += --enable-zzip#                   #enable zip archive support (default: disabled)
CONFIGURE_ARGS += --enable-aac#                    #disable AAC support (default: enable)

INSTALL_TARGET = install_target #myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myInstall
myInstall:
	cp --remove-destination $(TC_PATH)../$(TC_TARGET)/sys-root/lib/libssp.so.0.0.0 $(STAGING_INSTALL_PREFIX)/lib/libssp.so.0.0.0
	ln -sfv ./libssp.so.0.0.0 $(STAGING_INSTALL_PREFIX)/lib/libssp.so.0
	ln -sfv ./libssp.so.0     $(STAGING_INSTALL_PREFIX)/lib/libssp.so
