#!/bin/bash
# dos2unix /usr/local/bin/queues_entrypoint.sh
# chmod a+x /usr/local/bin/queues_entrypoint.sh
# crontab -e
# * * * * * /usr/local/bin/queues_entrypoint.sh
# service crond restart

php_path="/usr/local/bin/php"
source_path="/var/www"

### pptv-fds-admin ###
p="$(ps aux | grep 'pptv-fds-admin/artisan queue:work' | grep -v grep | awk '{ print $2 }' | head -1)"

if [ -z "$p" ]
then
    p="$($php_path $source_path/pptv-fds-admin/artisan queue:work sqs --daemon --sleep=3 --tries=3 &)"
else
    echo $p
fi

### pptv-fds-cronjob ###
p="$(ps aux | grep 'pptv-fds-cronjob/artisan queue:work' | grep -v grep | awk '{ print $2 }' | head -1)"

if [ -z "$p" ]
then
    p="$($php_path $source_path/pptv-fds-cronjob/artisan queue:work sqs --daemon --sleep=3 --tries=3 &)"
else
    echo $p
fi
