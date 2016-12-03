#!/bin/sh

# Package
PACKAGE="mpd"
DNAME="mpd"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
SSS="/var/packages/${PACKAGE}/scripts/start-stop-status"
PATH="${INSTALL_DIR}/bin:${PATH}"
USER="mpd"
GROUP="users"
TMP_DIR="${SYNOPKG_PKGDEST}/../../@tmp"

MPD_CONF="${INSTALL_DIR}/var/mpd.conf"
MPD_PLAYLIST="${INSTALL_DIR}/var/mpd.playlists/"
MPD_DB="${INSTALL_DIR}/var/mpd.tag.cache"
MPD_LOG="${INSTALL_DIR}/var/mpd.log"
MPD_PID="${INSTALL_DIR}/var/mpd.pid"
MPD_STATE="${INSTALL_DIR}/var/mpd.state"

SERVICETOOL="/usr/syno/bin/servicetool"
FWPORTS="/var/packages/${PACKAGE}/scripts/${PACKAGE}.sc"

preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    # Install busybox stuff
    ${INSTALL_DIR}/bin/busybox --install ${INSTALL_DIR}/bin

    # Create user
    adduser -h ${INSTALL_DIR}/var -g "${DNAME} User" -G ${GROUP} -s /bin/sh -S -D ${USER}

    # Correct the files ownership
    chown -R ${USER}:root ${SYNOPKG_PKGDEST}

    # Add firewall config
    ${SERVICETOOL} --install-configure-file --package ${FWPORTS} >> /dev/null

    # Create empty auxiliary files (if not found)
    install -d -m 755 ${MPD_PLAYLIST}
    if [ ! -e "${MPD_DB}"       ]; then install -m    755 /dev/null ${MPD_DB};       fi
    if [ ! -e "${MPD_LOG}"      ]; then install -m    755 /dev/null ${MPD_LOG};      fi
    if [ ! -e "${MPD_PID}"      ]; then install -m    755 /dev/null ${MPD_PID};      fi
    if [ ! -e "${MPD_STATE}"    ]; then install -m    755 /dev/null ${MPD_STATE};    fi

    exit 0
}

preuninst ()
{
    # Stop the package
    ${SSS} stop > /dev/null

    # Remove the user (if not upgrading)
    if [ "${SYNOPKG_PKG_STATUS}" != "UPGRADE" ]; then
        delgroup ${USER} ${GROUP}
        deluser ${USER}
    fi

    # Remove firewall config
    if [ "${SYNOPKG_PKG_STATUS}" == "UNINSTALL" ]; then
        ${SERVICETOOL} --remove-configure-file --package ${PACKAGE}.sc >> /dev/null
    fi

    exit 0
}

postuninst ()
{
    # Remove link
    rm -f ${INSTALL_DIR}

    exit 0
}

preupgrade ()
{
    # Stop the package
    ${SSS} stop > /dev/null

    # Save some stuff
    rm -fr ${TMP_DIR}/${PACKAGE}
    mkdir -p ${TMP_DIR}/${PACKAGE}
    mv ${INSTALL_DIR}/var ${TMP_DIR}/${PACKAGE}/

    exit 0
}

postupgrade ()
{
    # Restore some stuff
    rm -fr ${INSTALL_DIR}/var
    mv ${TMP_DIR}/${PACKAGE}/var ${INSTALL_DIR}/
    rm -fr ${TMP_DIR}/${PACKAGE}

    exit 0
}
