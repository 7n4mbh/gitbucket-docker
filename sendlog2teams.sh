#!/bin/sh

SINCE=`date +"%Y-%m-%dT%H:%M:%S" --date '1 day ago'`
LOG_MESSAGE_BACKUP=`docker logs --since "$SINCE" backup 2>&1 | sed -z 's/\n/  \n/g'`
#LOG_MESSAGE_GITBUCKET=`docker logs --since "$SINCE" gitbucket 2>&1 | sed -z 's/\n/  \n/g'`
#LOG_MESSAGE_MYSQL=`docker logs --since "$SINCE" db 2>&1 | sed -z 's/\n/  \n/g'`

#JSON_MESSAGE="{\"Text\": \"# **Backup Log**  \n$LOG_MESSAGE_BACKUP  \n  \n# **GitBucket Log**  \n$LOG_MESSAGE_GITBUCKET  \n  \n# **MySQL Log**  \n$LOG_MESSAGE_MYSQL\"}"
JSON_MESSAGE="{\"Text\": \"# **Backup Log**  \n$LOG_MESSAGE_BACKUP\"}"

#echo "$JSON_MESSAGE"

curl -s -X POST -d "$JSON_MESSAGE" $1
