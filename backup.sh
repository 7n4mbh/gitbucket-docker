#!/bin/sh

# Name of an archived file to be created
FILE_OUT=backup_`date +%Y%m%d`.tgz

echo "Started Gitbucket Backup: $FILE_OUT"

# Create a temporary MySQL dump file
mysqldump --single-transaction -uroot -hdb gitbucket > /mnt/from/mysql_gitbucket.dump

# Execute archiving
tar czf /mnt/to/$FILE_OUT -C /mnt/from repositories mysql_gitbucket.dump

# Remove MySQL dump file
rm -f /mnt/from/mysql_gitbucket.dump

echo "Removing old backup files..."

# Delete old backup files (older than a week)
# find /mnt/to -mtime +7 -name *tgz -print
find /mnt/to -mtime +7 -name *tgz -exec rm -rf {} \;

echo "Done."
