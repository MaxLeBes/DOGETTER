#!/bin/env bash

shopt -s expand_aliases

crontab -l | grep -v "dogetter.sh" | grep -v "heartbeat-logiciel.sh" | grep -v "webmov_html.sh" > doggocron
cp "/usr/local/DogRandom/html/index.html" "/usr/local/DogRandom/utrash/indx.html"
C_html="$(cat -v -t -e "/usr/local/DogRandom/utrash/indx.html")"
C_html="${C_html//\^M$/}"
C_html="${C_html//\$/}"
C_html="${C_html//\ONLINE/OFFLINE}"
C_html="${C_html//\green/red}"
echo $C_html > "/usr/local/DogRandom/utrash/indx.html"
mv -f "/usr/local/DogRandom/utrash/indx.html" "/usr/local/DogRandom/html/index.html"
crontab doggocron
rm doggocron


crontab -l > doggocron
echo "*/30 * * * * /usr/local/DogRandom/Scripts/dogetter.sh" >> doggocron
/usr/local/DogRandom/Scripts/heartbeat-logiciel.sh
echo "*/2 * * * * /usr/local/DogRandom/Scripts/heartbeat-logiciel.sh" >> doggocron
echo "45 23 * * * /usr/local/DogRandom/Scripts/webmov_html.sh" >> doggocron
crontab doggocron
rm doggocron

alias dogetter="/usr/local/DogRandom/Scripts/alias.sh"
echo "$(date "+%H:%M - %D :") Dogetter est en ligne" >> "/var/log/dogetter/dogetter.log"

echo "Dogetter service est maintenant actif"