#!/bin/sh

# Package configuration values
PACKAGE="transmission"
DNAME="Transmission"
RUNAS="transmission"
TR_UTILS="transmission-cli transmission-create transmission-edit \
          transmission-remote transmission-show"

# Common definitions
INSTALL_DIR="/usr/local/${PACKAGE}"
CONFIG_DIR="${INSTALL_DIR}/var"
# Assume that ${SYNOPKG_PKGDEST} is a link to /volumeX/@appstore/${PACKAGE}
TMP_BASE=`realpath ${SYNOPKG_PKGDEST} | cut -d/ -f1-2`/@tmp
UPGRADE_FLAG_FILE=/tmp/${PACKAGE}-upgrade
PATH="${INSTALL_DIR}/bin:/usr/local/bin:/bin:/usr/bin:/usr/syno/bin"
SYNO3APP="/usr/syno/synoman/webman/3rdparty"


#########################################
# DSM package manager functions
preinst ()
{
    exit 0
}

postinst ()
{
    # Remove the DSM user (legacy)
    if /usr/syno/sbin/synouser --enum local | grep "^${RUNAS}$" >/dev/null
    then
        /usr/syno/sbin/synouser --del ${RUNAS} 2> /dev/null
    fi
    
    # Link the installed file in the view directory
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    # DSM Desktop icon
    ln -s ${INSTALL_DIR}/app ${SYNO3APP}/${PACKAGE}

    # Create symlinks to utils
    mkdir -p /usr/local/bin
    for exe in ${TR_UTILS}
    do
      ln -s ${INSTALL_DIR}/bin/${exe} /usr/local/bin/${exe}
    done
    ln -s /var/packages/${PACKAGE}/scripts/start-stop-status /usr/local/bin/${PACKAGE}-ctl 

    # Restore the previous user configuration, if any
    if [ -f ${UPGRADE_FLAG_FILE} ]
    then
        TMP_DIR=`cat ${UPGRADE_FLAG_FILE}`
        rm ${UPGRADE_FLAG_FILE}
        if [ -d ${TMP_DIR} ]
        then
            rm -fr ${CONFIG_DIR}
            mv ${TMP_DIR} ${CONFIG_DIR}
        fi
    fi

    # Update the configuration file
    ${INSTALL_DIR}/bin/transmission-daemon -g ${CONFIG_DIR}/ -d 2> ${CONFIG_DIR}/new.settings.json
    mv ${CONFIG_DIR}/new.settings.json ${CONFIG_DIR}/settings.json
    chmod 600 ${CONFIG_DIR}/settings.json

    # Install busybox stuff
    ${INSTALL_DIR}/bin/busybox --install ${INSTALL_DIR}/bin

    # Create the daemon user if needed
    if grep "^${RUNAS}:" /etc/passwd >/dev/null
    then
        true
    else
        adduser -h ${CONFIG_DIR} -g "${DNAME} Daemon User" -G users -s /bin/sh -S -D ${RUNAS}
    fi

    # Correct the files ownership
    chown -R root:root ${SYNOPKG_PKGDEST}
    chown -R ${RUNAS}:users ${CONFIG_DIR}

    # Correct permission and ownership of download directory
    downloadDir=`grep download-dir ${CONFIG_DIR}/settings.json | cut -d'"' -f4`
    if [ -n "${downloadDir}" -a -d "${downloadDir}" ]
    then
        chown -Rh ${RUNAS}:users ${downloadDir}
        chmod -R g+w ${downloadDir}
    fi

    # Correct permission and ownership of incomplete directory
    incompleteDir=`grep incomplete-dir ${CONFIG_DIR}/settings.json | cut -d'"' -f4`
    if [ -n "${incompleteDir}" -a -d "${incompleteDir}" ]
    then
        chown -Rh ${RUNAS}:users ${incompleteDir}
    fi

    exit 0
}

preuninst ()
{
    # Remove the user (if not upgrading)
    if [ -f ${UPGRADE_FLAG_FILE} ]
    then
        deluser ${RUNAS}
    fi

    # Remove the DSM desktop icon
    rm ${SYNO3APP}/${PACKAGE}
    
    exit 0
}

postuninst ()
{
    # Remove symlinks to utils
    for exe in ${TR_UTILS}
    do
      rm /usr/local/bin/${exe}
    done
    rm /usr/local/bin/${PACKAGE}-ctl 
    # Remove link
    rm -f ${INSTALL_DIR}

    exit 0
}

preupgrade ()
{
    # Make sure the package is not running while we are upgrading it
    /usr/local/bin/${PACKAGE}-ctl stop

    TMP_DIR=${TMP_BASE}/${PACKAGE}-$$
    echo ${TMP_DIR} > ${UPGRADE_FLAG_FILE}

    # Save the users settings before the upgrade
    # Mind the order here!
    for config_dir in /usr/local/var/transmission \
                      ${INSTALL_DIR}/var \
                      ${SYNOPKG_PKGDEST}/var \
                      ${SYNOPKG_PKGDEST}/usr/local/var/lib/transmission-daemon
    do
        if [ -d ${config_dir} ]
        then
            mv ${config_dir} ${TMP_DIR}
            break
        fi
    done

    exit 0
}

postupgrade ()
{
    exit 0
}

