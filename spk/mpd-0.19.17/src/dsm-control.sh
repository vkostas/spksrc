#!/bin/sh

# Package
PACKAGE="mpd"
DNAME="MPD"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PYTHON_DIR="${INSTALL_DIR}/../python"
PATH="${INSTALL_DIR}/bin:${PYTHON_DIR}/bin:${PATH}"
USER="mpd"
MPD="${INSTALL_DIR}/bin/mpd"
CONF_FILE="${INSTALL_DIR}/var/mpd.conf"
PID_FILE="${INSTALL_DIR}/var/mpd.pid"
LOG_FILE="${INSTALL_DIR}/var/mpd.log"
COMMAND="${MPD} ${CONF_FILE}"

start_daemon ()
{
    start-stop-daemon -c ${USER} -S -q -b -p ${PID_FILE} -x ${COMMAND} > /dev/null
}

stop_daemon ()
{
    start-stop-daemon -K -q -u ${USER} -p ${PID_FILE}
    wait_for_status 1 20 || start-stop-daemon -K -s 9 -q -p ${PID_FILE}
}

daemon_status ()
{
    start-stop-daemon -K -q -t -u ${USER} -p ${PID_FILE}
}

wait_for_status ()
{
    counter=$2
    while [ ${counter} -gt 0 ]; do
        daemon_status
        [ $? -eq $1 ] && return
        let counter=counter-1
        sleep 1
    done
    return 1
}


case $1 in
    start)
        if daemon_status; then
            echo ${DNAME} is already running
            exit 0
        else
            echo Starting ${DNAME} ...
            start_daemon
            exit $?
        fi
        ;;
    stop)
        if daemon_status; then
            echo Stopping ${DNAME} ...
            stop_daemon
            exit $?
        else
            echo ${DNAME} is not running
            exit 0
        fi
        ;;
    restart)
        stop_daemon
        start_daemon
        exit $?
        ;;
    status)
        if daemon_status; then
            echo ${DNAME} is running
            exit 0
        else
            echo ${DNAME} is not running
            exit 1
        fi
        ;;
    log)
        echo ${LOG_FILE}
        ;;
    *)
        exit 1
        ;;
esac