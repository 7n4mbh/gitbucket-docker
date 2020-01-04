#!/bin/sh

set -e

host="$1"

until mysql -uroot -h"$host" -e 'show databases' > /dev/null; do
  >&2 echo "MySQL is unavailable - retrying"
  sleep 1
done

>&2 echo "MySQL is up - starting gitbucket"
exec java -jar /opt/gitbucket.war
