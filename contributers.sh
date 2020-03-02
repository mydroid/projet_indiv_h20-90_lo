#!/bin/bash
# A utiliser dans le dossier racine du projet 
# CHEMIN doit indiquer la place désiré a mettre les rapports

declare CHEMIN="/drives/c/MyFolder/univer2/mgl7460/"
echo ' Nombre total des contributeurs au projet : ' > "$CHEMIN"stats.csv
git log --pretty=format:"%an"   | sort | uniq  | wc -l  | tr -d ‘ ‘ >> "$CHEMIN"stats.csv
git log --pretty=format:"%an"   | sort | uniq  |  tr -d ‘ ‘ > "$CHEMIN"authors.csv

echo ' Nombre total des commiteurs au projet : ' >> "$CHEMIN"stats.csv
git log --pretty=format:"%cn"   | sort | uniq  | wc -l  | tr -d ‘ ‘ >> "$CHEMIN"stats.csv
git log --pretty=format:"%cn"   | sort | uniq  | tr -d ‘ ‘ > "$CHEMIN"commiters.csv

echo ' Nombre total des commits au projet : ' >> "$CHEMIN"stats.csv
git log --oneline | wc -l | tr -d ‘ ‘ >> "$CHEMIN"stats.csv

declare AUTHOR
exec 3< "$CHEMIN"authors.csv
while read AUTHOR <&3 ; do
    #echo "$LINE" >> /drives/c/MyFolder/univer2/mgl7460/contribution_commits.csv
    git log --oneline --author="$AUTHOR" | wc -l  >> "$CHEMIN"authors_commits.csv
done

paste -d , "$CHEMIN"authors_commits.csv "$CHEMIN"authors.csv > "$CHEMIN"authors_by_commits.csv
sort -n -r "$CHEMIN"authors_by_commits.csv > "$CHEMIN"authors_commits_sorted.csv # pour le moment ca marche pas -nk2

declare COMMITER
exec 3< "$CHEMIN"commiters.csv
while read COMMITER <&3 ; do
    git log --oneline --author="$COMMITER" | wc -l  >> "$CHEMIN"commiter_commits.csv
done

paste -d , "$CHEMIN"commiter_commits.csv "$CHEMIN"commiters.csv > "$CHEMIN"commiter_by_commits.csv
sort -n -r "$CHEMIN"commiter_by_commits.csv > "$CHEMIN"commiter_commits_sorted.csv

