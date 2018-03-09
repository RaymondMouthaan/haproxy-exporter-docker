#!/bin/sh -e

# if command starts with an option, prepend haproxy-exporter binary
if [ "${1:0:1}" = '-' ]; then
  set -- $HAPROXY_EXPORTER_BIN "$@"
fi

exec "$@"
