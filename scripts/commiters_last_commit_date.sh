#!/usr/bin/env bash
# A utiliser dans le dossier racine du projet 
# Script pour l'etape d'extraction du date derniere commit par commiteur
# CHEMIN doit etre indiquer comme 1 parametre - la place désiré a mettre les rapports

#declare CHEMIN="/drives/c/MyFolder/univer2/mgl7460/"

CHEMIN=$1

echo Debut script extraction date derniere commit

declare COMMITER

exec 3< "$CHEMIN"commiters.csv

while read COMMITER <&3 ; do
   git log --author="$COMMITER" --pretty="Author -  %an :  last commit  :  %ad" --date=short | head -n1 >> "$CHEMIN"commiter_last_commit_date.csv
done

echo Fin script extraction date derniere commit

