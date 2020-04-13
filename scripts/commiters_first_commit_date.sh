#!/usr/bin/env bash
# A utiliser dans le dossier racine du projet 
# Script pour l'etape d'extraction du date premiere commit par commiteur
# CHEMIN doit etre indiquer comme 1 parametre - la place désiré a mettre les rapports

#declare CHEMIN="/drives/c/MyFolder/univer2/mgl7460/"

CHEMIN=$1

echo Debut script extraction date premiere commit

declare COMMITER

exec 3< "$CHEMIN"commiters.csv

while read COMMITER <&3 ; do
   git log --author="$COMMITER" --pretty="Author - %an :  first commit  :  %ad" --date=short --reverse  | head -n1 >> "$CHEMIN"commiter_first_commit_date.csv
done

echo Fin script extraction date premiere commit
