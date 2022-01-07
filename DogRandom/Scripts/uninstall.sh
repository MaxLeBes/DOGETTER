#!/bin/env bash
echo "$(date "+%H:%M - %D :") Dogetter se désinstalle" >> "/var/log/dogetter/dogetter.log"
echo "$(date "+%H:%M - %D :") Dogetter se désinstalle"

shopt -s expand_aliases

source "/usr/local/DogRandom/Scripts/stop.sh"

rm -r "/usr/local/DogRandom" "/var/www/html" "/usr/local/DGUNINSTALL"

echo "$(date "+%H:%M - %D :") Dogetter est désinstallé" >> "/var/log/dogetter/dogetter.log"