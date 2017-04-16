#!/bin/bash
source /opt/rh/rh-ruby22/enable
case "$1" in
  start)
    /home/deploy/.gem/bin/bundle exec /home/deploy/.gem/bin/passenger start -R /var/server/kksystem/config.ru --daemonize --socket /var/server/kksystem/passenger.sock --pid-file /var/run/kksystem/passenger.pid --log-file /var/server/kksystem/log/passenger.log --environment production
    ;;
  stop)
    /home/deploy/.gem/bin/bundle exec /home/deploy/.gem/bin/passenger stop --pid-file /var/run/kksystem/passenger.pid
    ;;
  restart)
    /home/deploy/.gem/bin/bundle exec /home/deploy/gem/bin/passenger-config restart-app /var/server/kksystem
    ;;
esac
