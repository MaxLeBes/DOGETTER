#!/bin/env bash

shopt -s expand_aliases

Script=$1
YES=
if [ "$Script" == "" ]; then
    echo "Veuillez entrer une commande Dogetter. Ecrivez help (--h, --help) pour afficher l'aide"
    exit
fi
if [ "$Script" == "doggo" ]; then
    echo "L'éxécution de doggeter sera forcée."
    source "/usr/local/DogRandom/Scripts/dogetter.sh"
    exit
fi
if [ "$Script" == "html" ]; then
    echo "La formation de la page html sera forcée. Peut casser le script."
    echo "Voulez-vous continuer ?(O pour continuer, autre chose pour quitter)"
    read ans
    if [ "$ans" == "O" ] || [ "$ans" == "o" ] || [ "$ans" == "Oui" ] || [ "$ans" == "oui" ]; then
      source "/usr/local/DogRandom/Scripts/webmov_html.sh"
    fi
    exit
fi
if [ "$Script" == "toggle" ] || [ "$Script" == "-t" ]; then
    echo "Le mode d'activité sera changé"
    source "/usr/local/DogRandom/Scripts/toggle.sh"
    exit
fi
if [ "$Script" == "-h" ]|| [ "$Script" == "--help" ] || [ "$Script" == "help" ]; then
    echo "toggle/-t : Change l'état du script (actif/Inactif)"
    echo "doggo : Force l'éxécution de dogetter (pas conseillé entre 23H30 et 00h"
    echo "html : Force la création de la page html. Fortement déconseillé."
    echo "help : affiche l'aide"
    echo "UNINSTALL : Désinstalle Dogetter. Ne désinstalle pas les dépendances (ie: apache2)"
    exit
fi
if [ "$Script" == "UNINSTALL" ]; then
  echo "Ce script va supprimer tout les fichiers liés à Dogetter."
  echo "Voulez-vous continuer ?(O pour continuer, autre chose pour quitter)"
  read ans
  if [ "$ans" == "O" ] || [ "$ans" == "o" ] || [ "$ans" == "Oui" ] || [ "$ans" == "oui" ]; then
       source  "/usr/local/DGUNINSTALL/uninstall.sh"
  fi
  exit
fi

echo "Commande dogetter inconnue. Si vous n'avez pas utilisé dogetter, verifiez vos alias (commande 'alias')"
exit