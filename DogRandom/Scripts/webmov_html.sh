
LIST=$(ls -1 /usr/local/DogRandom/img/)
chmod +w /usr/local/DogRandom/
Count=$(echo $LIST | wc -w)
while [ "$Count" != '0' ]; do
    echo "$Count"
    OBJ=$(echo "$LIST" | awk '{print $1;}')
    echo "$OBJ"
    Item_time=$(echo $OBJ | awk -F '_' '{print $1}')
    # shellcheck disable=SC2086
    echo $Item_time
    Item_date=$(echo $OBJ | awk -F '_' '{print $2}')
    echo "$Item_date"
    Item_Breed=$(echo $OBJ | awk -F '_' '{print $3}')
    echo "$Item_Breed"
    format="<tr><td>$(date -d "$Item_time" +%H:%M)</td><td>$Item_Breed</td><td>"'<img src="ressources/'$OBJ'"></td></tr></tbody>'
    echo $format
    cp /usr/local/DogRandom/html/photos.html sedmdf
    sed -i "s*</tbody>*$format*g" sedmdf
    rm /usr/local/DogRandom/html/photos.html
    mv sedmdf "/usr/local/DogRandom/html/photos.html"
    LIST=$(echo $LIST | grep -v $OBJ)
    echo "-------------------EOF-------------------"
done



