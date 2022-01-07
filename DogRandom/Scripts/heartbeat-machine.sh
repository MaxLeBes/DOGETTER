#!/bin/env bash

CurCron=$(crontab -l)
Toggle=$(crontab -l | grep -v "dogetter.sh")

if [ "$CurCron" == "$Toggle" ]; then
  cp "/usr/local/DogRandom/html/index.html" "/usr/local/DogRandom/utrash/indx.html"
  O_state="$(cat "/usr/local/DogRandom/utrash/indx.html" | grep "OFFLINE")"
  N_state="ONLINE"
  ol="$(cat "/usr/local/DogRandom/utrash/indx.html" | grep "red")"
  nl="color: green;"
  sed -i "s*$O_state*$N_state*g" "/usr/local/DogRandom/utrash/indx.html"
  sed -i "s*$ol*$nl*g" "/usr/local/DogRandom/utrash/indx.html"
  mv -f "/usr/local/DogRandom/utrash/indx.html" "/usr/local/DogRandom/html/index.html"
  else
    cp "/usr/local/DogRandom/html/index.html" "/usr/local/DogRandom/utrash/indx.html"
    O_state="$(cat "/usr/local/DogRandom/utrash/indx.html" | grep "ONLINE")"
    N_state="OFFLINE"
    ol="$(cat "/usr/local/DogRandom/utrash/indx.html" | grep "green")"
    nl="color: red;"
    sed -i "s*$O_state*$N_state*g" "/usr/local/DogRandom/utrash/indx.html"
    sed -i "s*$ol*$nl*g" "/usr/local/DogRandom/utrash/indx.html"
    mv -f "/usr/local/DogRandom/utrash/indx.html" "/usr/local/DogRandom/html/index.html"
fi