CurCron=$(crontab -l)
Toggle=$(crontab -l | grep -v "dogetter.sh")

if [ "$CurCron" == "$Toggle" ]; then
  crontab -l > doggocron
  echo "*/30 * * * * ~/DogRandom/Scripts/dogetter.sh" >> doggocron
  crontab doggocron
  rm doggocron
  else
    crontab -l | grep -v "dogetter.sh" > doggocron
    crontab doggocron
    rm doggocron
fi