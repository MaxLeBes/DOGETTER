#!/bin/env bash
echo "$(date "+%H:%M - %D :") Dogetter fonctionne" >> "/var/log/dogetter/dogetter.log"
echo "$(date "+%H:%M - %D :") Dogetter fonctionne"

cp "/usr/local/DogRandom/html/index.html" "/usr/local/DogRandom/utrash/indx.html"
C_html="$(cat -v -t -e "/usr/local/DogRandom/utrash/indx.html")"
C_html="${C_html//\^M$/}"
C_html="${C_html//\$/}"
C_html="${C_html//\OFFLINE/ONLINE}"
C_html="${C_html//\red/green}"
echo $C_html > "/usr/local/DogRandom/utrash/indx.html"
mv -f "/usr/local/DogRandom/utrash/indx.html" "/usr/local/DogRandom/html/index.html"

#{VAR}="${VAR//\[to delete]/[new var - can be empty]}"