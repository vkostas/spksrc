#!/bin/sh

# Package
PACKAGE="transmission"
DNAME="Transmission"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
PATH="${INSTALL_DIR}/bin:/usr/local/bin:/bin:/usr/bin:/usr/syno/bin"
RUNAS="transmission"
TRANSMISSION="${INSTALL_DIR}/bin/transmission-daemon"
PID_FILE="${INSTALL_DIR}/var/transmission.pid"


start_daemon ()
{
    # Launch the service in the background.
    su - ${RUNAS} -c "${TRANSMISSION} -g ${INSTALL_DIR}/var/ -x ${PID_FILE}"
    # Wait until the service  is ready (race condition here).
    counter=5
    while [ $counter -gt 0 ]
    do
        daemon_status && break
        let counter=counter-1
        sleep 1
    done
}

stop_daemon ()
{
    # Kill the servive.
    kill `cat ${PID_FILE}`

    # Wait until transmission is really dead (may take some time).
    counter=20
    while [ $counter -gt 0 ] 
    do
        daemon_status || break
        let counter=counter-1
        sleep 1
    done
}

reload_daemon ()
{
    # Reload the config file.
    kill -s HUP `cat $TRPID`
}

daemon_status ()
{
    if [ -f ${PID_FILE} ] && [ -d /proc/`cat ${PID_FILE}` ]; then
        return 0
    fi
    return 1
}

run_in_console ()
{
    # Run the service in the foreground, with the mesages in the current console.
    su - $RUNAS -c "$TREXE -g $TRVAR -f"
}

case $1 in
    start)
        if daemon_status
        then
            echo ${DNAME} is already running
            exit 0
        else
            echo Starting ${DNAME} ...
            start_daemon
            exit $?
        fi
        ;;
    stop)
        if daemon_status
	then
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
    reload)
        if daemon_status
        then
           reload_daemon
        fi
        exit $?
        ;;
    status)
        if daemon_status
	then
            echo ${DNAME} is running
            exit 0
        else
            echo ${DNAME} is not running
            exit 1
        fi
        ;;
    log)
        echo $LOGFILE
        exit 0
        ;;
    console)
        run_in_console
        ;;
    *)
        exit 1
        ;;
esac

