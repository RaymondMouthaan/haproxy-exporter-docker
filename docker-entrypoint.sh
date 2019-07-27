#!/bin/sh -e

# if command starts with an option, prepend haproxy-exporter binary
if [ "${1:0:1}" = '-' ]; then
  set -- /bin/haproxy_exporter "$@"
fi

exec "$@"
