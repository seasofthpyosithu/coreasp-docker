#!/bin/bash


LIB="/var/www/management/libs_ver2.0/"
SCRIPT="/var/www/management/scripts/"

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
    kill $(ps aux | grep '[c]rond' | awk '{print $2}')
}

start() {
    crond
}

start
monitor "$LIB" &
monitor "$SCRIPT"