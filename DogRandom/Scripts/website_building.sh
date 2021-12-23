apt-get update>zsz
apt-get upgrade>zsz
apt-get install apache2 php7.4 php7.4-mysql apache2-mod-php7.4 -y | grep bullpoint>zsz
rm zsz
touch /var/www/html/index.html
rm /var/www/html/index.html
mkdir "/usr/local/DogRandom"
mkdir "/usr/local/DogRandom/img"
mkdir "/usr/local/DogRandom/Scripts"
mkdir "/usr/local/DogRandom/html"
dPath="/usr/local/DogRandom"
touch "/usr/local/DogRandom/html/index.html"
ln -s "/usr/local/DogRandom/html/" "/var/www/html/"
