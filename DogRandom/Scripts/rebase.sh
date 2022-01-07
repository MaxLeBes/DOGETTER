#!/bin/env bash

echo "$(date "+%H:%M - %D :") Dogetter va essayer d'archiver la page web (mais dogetter promet rien)" >> "/var/log/dogetter/dogetter.log"

get_first(){
  echo $1
  }

mv "/usr/local/DogRandom/html/ressources/base.html" "/usr/local/DogRandom/html/base.html"
LIST=$(ls -1 "/usr/local/DogRandom/html/ressources/")
Date_Set=$(get_first $LIST | awk -F '_' '{print $2}')
if [ "$Date_Set" == "" ]; then
    Date_Set="$(ls -1 "/usr/local/DogRandom/html/ressources/" | wc -l)""OLW"
fi
mkdir "/usr/local/DogRandom/html/older/$Date_Set"
mv "/usr/local/DogRandom/html/photos.html" "/usr/local/DogRandom/html/older/$Date_Set/photos.html"
mv "/usr/local/DogRandom/html/ressources"  "/usr/local/DogRandom/html/older/$Date_Set/ressources"
cp "/usr/local/DogRandom/html/base.html" "/usr/local/DogRandom/html/photos.html"
mkdir "/usr/local/DogRandom/html/ressources/"
mv "/usr/local/DogRandom/html/base.html" "/usr/local/DogRandom/html/ressources/base.html"

cp "/usr/local/DogRandom/html/archives.html" "/usr/local/DogRandom/utrash/sedmdf"
fo="${Date_Set:0:2}-${Date_Set:2:2}-${Date_Set:4:4}"
format="<tr><td>$fo</td>"'<td><a href="older/'"$Date_Set"'/photos.html">Lien</a></td></tr></tbody>'
sed -i "s*</tbody>*$format*g" "/usr/local/DogRandom/utrash/sedmdf"
mv -f "/usr/local/DogRandom/utrash/sedmdf" "/usr/local/DogRandom/html/archives.html"
