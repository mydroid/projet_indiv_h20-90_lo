#!/usr/bin/env bash
# A utiliser dans le dossier racine du projet 
# Script pour l'etape d'analyse d'auteurs
# CHEMIN doit etre indiquer comme 1 parametre - la place désiré a mettre les rapports

#declare CHEMIN="/drives/c/MyFolder/univer2/mgl7460/"

CHEMIN=$1

echo Debut script extraction auteurs

declare AUTHOR

exec 3< "$CHEMIN"authors.csv

while read AUTHOR <&3 ; do
    #echo "$LINE" >> /drives/c/MyFolder/univer2/mgl7460/contribution_commits.csv
    git log --oneline --author="$AUTHOR" | wc -l  >> "$CHEMIN"authors_commits.csv
done

paste -d , "$CHEMIN"authors_commits.csv "$CHEMIN"authors.csv > "$CHEMIN"authors_by_commits.csv
sort -n -r "$CHEMIN"authors_by_commits.csv > "$CHEMIN"authors_commits_sorted.csv # pour le moment ca marche pas -nk2

echo Fin script extraction auteurs