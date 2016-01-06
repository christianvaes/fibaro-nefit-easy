#! /bin/sh
### BEGIN INIT INFO
# Provides: Nefit easy http server application instance
# Required-Start: $all
# Required-Stop: $all
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: starts instance of nefit easy http server
# Description: starts instance of Nefit easy http server using start-stop-daemon
### END INIT INFO
############### EDIT ME ##################
QPKG_NAME=NefitEasyHttpServer
QPKG_DIR=
DAEMON=
DAEMON_OPTS="/share/MD0_DATA/.qpkg/NefitEasyHttpServer/bin/easy-server --host=0.0.0.0"

case "$1" in
start)

export PATH=/opt/bin:$PATH
export NEFIT_SERIAL_NUMBER={replace with your nefit easy serial number}
export NEFIT_ACCESS_KEY={replace with your nefit easy access key}
export NEFIT_PASSWORD={replace with your nefit easy password}

echo "Starting $QPKG_NAME"
if [ `/sbin/getcfg ${QPKG_NAME} Enable -u -d FALSE -f /etc/config/qpkg.conf` = UNKNOWN ]; then
/sbin/setcfg ${QPKG_NAME} Enable TRUE -f /etc/config/qpkg.conf
elif [ `/sbin/getcfg ${QPKG_NAME} Enable -u -d FALSE -f /etc/config/qpkg.conf` != TRUE ]; then
echo "${QPKG_NAME} is disabled."
exit 1
fi
/opt/bin/nohup ${DAEMON_OPTS} &
;;
stop)
echo "Stopping $QPKG_NAME"
for pid in $(/bin/pidof node); do
/bin/grep -q "easy" /proc/$pid/cmdline && /bin/kill $pid
done
/bin/sleep 2
;;
restart|force-reload)
echo "Restarting $QPKG_NAME"
$0 stop
$0 start
;;
*)
N=/etc/init.d/$QPKG_NAME
echo "Usage: $N {start|stop|restart|force-reload}" >&2
exit 1
;;
esac
exit 0

