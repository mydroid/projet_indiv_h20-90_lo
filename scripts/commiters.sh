#!/usr/bin/env bash
# A utiliser dans le dossier racine du projet 
# Script pour l'etape d'analyse de commiters
# CHEMIN doit etre indiquer comme 1 parametre - la place désiré a mettre les rapports

#declare CHEMIN="/drives/c/MyFolder/univer2/mgl7460/"

CHEMIN=$1

echo Debut script extraction commiters

declare COMMITER

exec 3< "$CHEMIN"commiters.csv

while read COMMITER <&3 ; do
    git log --oneline --author="$COMMITER" | wc -l  >> "$CHEMIN"commiter_commits.csv
done

paste -d , "$CHEMIN"commiter_commits.csv "$CHEMIN"commiters.csv > "$CHEMIN"commiter_by_commits.csv
sort -n -r "$CHEMIN"commiter_by_commits.csv > "$CHEMIN"commiter_commits_sorted.csv

echo Fin script extraction commiters