#!/bin/env bash
dPath="/usr/local/DogRandom"

RANDOM_DOG_JSON=$(curl -s https://dog.ceo/api/breeds/image/random)
RANDOM_DOG_JSON="${RANDOM_DOG_JSON//\\/}"
DOGurl=$(echo "$RANDOM_DOG_JSON" | awk -F '"' '{print $4}')
Breed=$(echo $DOGurl | awk -F '/' '{print $5}')

Filename=$(echo $DOGurl | awk -F '/' '{print $6}')
newname=$(date +%H%M_%d%m%Y)
newname="$newname""_$Breed""_"
imgPath=$dPath"/img/"
wget --quiet --directory-prefix=$imgPath $DOGurl
mv "$imgPath""$Filename" "$imgPath""$newname.jpg"












