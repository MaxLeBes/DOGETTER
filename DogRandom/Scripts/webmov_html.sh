#!/bin/env bash
echo "$(date "+%H:%M - %D :") Dogetter va créer une page web" >> "/var/log/dogetter/dogetter.log"
echo "$(date "+%H:%M - %D :") Dogetter va créer une page web"
get_first(){
  echo $1
  }
LIST=$(ls -1 /usr/local/DogRandom/img/)
Count=$(echo $LIST | wc -w)
dtime=$(get_first $LIST | awk -F '_' '{print $2}')
dtime="${dtime:0:2}-${dtime:2:2}-${dtime:4:4}"

C_html="$(cat -v -t -e "/usr/local/DogRandom/html/index.html")"
C_html="${C_html//\^M$/}"
C_html="${C_html//\$/}"
echo $C_html > zza
grep -o '<td class="noclass">.*</td>' zza | sed 's/\(<td class="noclass">\|<\/td>\)//g' > zzaa
O_Date="$(head -c 25 zzaa)"
N_Date=" Last update : $dtime"
sed -i "s*$O_Date*$N_Date*g" zza
C_html="$(cat zza)"
rm "/usr/local/DogRandom/html/index.html" zza zzaa
echo $C_html > "/usr/local/DogRandom/html/index.html"

#source "/mnt/c/Users/lebesnerais.maxime/LINUX/GitHub/DogRandom/Scripts/rebase.sh"

while [ "$Count" != '0' ]; do
    grC=$Count
    OBJ=$(get_first $LIST)
    Item_time=$(echo $OBJ | awk -F '_' '{print $1}')
    Item_Breed=$(echo $OBJ | awk -F '_' '{print $3}')
    format="<tr><td>$(date -d "$Item_time" +%H:%m)</td><td>$Item_Breed</td><td>"'<img src="ressources/'$OBJ'"></td></tr></tbody>'
    cp "/usr/local/DogRandom/html/photos.html" "/usr/local/DogRandom/utrash/sedmdf"
    sed -i "s*</tbody>*$format*g" "/usr/local/DogRandom/utrash/sedmdf"
    mv -f "/usr/local/DogRandom/utrash/sedmdf" "/usr/local/DogRandom/html/photos.html"
    LIST=$(echo $LIST | sed "s@$OBJ @""@g")
    mv "/usr/local/DogRandom/img/$OBJ" "/usr/local/DogRandom/html/ressources/$OBJ"
    Count=$(echo $LIST | wc -w)
    if [ $Count == $grC ]; then
        Count="0"
    fi
    unset OBJ
done
echo "$(date "+%H:%M - %D :") Dogetter a créé une page web" >> "/var/log/dogetter/dogetter.log"
echo "$(date "+%H:%M - %D :") Dogetter a créé une page web"