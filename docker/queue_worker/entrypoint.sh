#!/bin/bash

LIB="/var/www/queue_worker/libs_ver2.0/"
SCRIPT="/var/www/queue_worker/scripts/"

monitor () {
inotifywait -m -r -e "create,modify,delete,move" --format "%e %f" "$1" | while read EVENT FILE
do
    if [[ "$FILE" =~ .*php$ ]]; then # Does the file end with .xml?
        echo "$FILE has been $EVENT" # If so, do your thing here!
        stop
        start
    fi
done
}

stop() {
    kill $(ps aux | grep '[a]ndroid_individual_worker.php' | awk '{print $2}')
    kill $(ps aux | grep '[i]phone_individual_worker.php' | awk '{print $2}')
    kill $(ps aux | grep '[a]ndroid_worker.php' | awk '{print $2}')
    kill $(ps aux | grep '[i]phone_worker.php' | awk '{print $2}')
    kill $(ps aux | grep '[a]ndroid_rich_worker.php' | awk '{print $2}')
    kill $(ps aux | grep '[i]phone_rich_worker.php' | awk '{print $2}')
    kill $(ps aux | grep '[a]ndroid_ab_test_push_worker.php' | awk '{print $2}')
}

start() {
    /usr/bin/php /var/www/queue_worker/scripts/android_individual_worker.php >> /dev/stdout 2>&1 &
    /usr/bin/php /var/www/queue_worker/scripts/iphone_individual_worker.php >> /dev/stdout 2>&1 &
    /usr/bin/php /var/www/queue_worker/scripts/android_worker.php >> /dev/stdout 2>&1 &
    /usr/bin/php /var/www/queue_worker/scripts/iphone_worker.php >> /dev/stdout 2>&1 &
    /usr/bin/php /var/www/queue_worker/scripts/android_rich_worker.php >> /dev/stdout 2>&1 &
    /usr/bin/php /var/www/queue_worker/scripts/iphone_rich_worker.php >> /dev/stdout 2>&1 &
    /usr/bin/php /var/www/queue_worker/scripts/android_ab_test_push_worker.php >> /dev/stdout 2>&1 &
    /usr/bin/php /var/www/queue_worker/scripts/iphone_ab_test_push_worker.php >> /dev/stdout 2>&1 &
}

start
monitor "$LIB" &
monitor "$SCRIPT"