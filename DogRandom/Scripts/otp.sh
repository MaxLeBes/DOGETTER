LIST=$(ls -1 /usr/local/DogRandom/img/)
Count=$(echo $LIST | wc -w)
while [ $Count != '0' ]; do
    OBJ=$(echo $LIST | awk '{print $1;}')
    echo $LIST
    LIST=$(echo $LIST | grep -v $OBJ)
done
[ $Count == "2" ] && echo "YES"
[ $Count != "2" ] && echo "NO"
fi