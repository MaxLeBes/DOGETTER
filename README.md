# DOGETTER - Le CRAWLER qui a du Chien

## Réalisé dans le cadre du cursus LINUX avec le professeur Kévin Frugier

#### Installation sur LINUX : 
- Télécharger le install.sh
- faire les commandes suivantes :

  ~~~sh
  wget --quiet --no-check-certificate 'https://docs.google.com/uc?export=download&id=1cIFC1xLmq0vaMgfdmFPgYltA8ce2E6e0' -O install.sh
  chmod +x install.sh 
  ./install.sh
  ~~~

>Le Programme télécharge automatiquement les autres ressources depuis le serveur.
> 
> Le lieu d'éxécution du programme sera /usr/local/DogRandom

Le programme obéit à systemctl

En plus des logs system, une copie des logs peut etre trouvée dans /var/log/dogetter/dogetter.log

Ecrivez simplement "dogetter" dans le terminal pour avoir un aperçue de la commande
