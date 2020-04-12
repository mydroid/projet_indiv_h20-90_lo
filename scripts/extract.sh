#!/usr/bin/env bash
# A utiliser dans le dossier racine du projet 
# Script pour l'etape d'extraction
# CHEMIN doit etre indiquer comme 1 parametre - la place désiré a mettre les rapports
#declare CHEMIN="/drives/c/MyFolder/univer2/mgl7460/"

CHEMIN=$1

echo Debut script extraction

echo ' Nombre total des contributeurs au projet : ' > "$CHEMIN"stats.csv

git log --pretty=format:"%an"   | sort | uniq  | wc -l  | tr -d ‘ ‘ >> "$CHEMIN"stats.csv
git log --pretty=format:"%an"   | sort | uniq  |  tr -d ‘ ‘ > "$CHEMIN"authors.csv

echo ' Nombre total des commiteurs au projet : ' >> "$CHEMIN"stats.csv

git log --pretty=format:"%cn"   | sort | uniq  | wc -l  | tr -d ‘ ‘ >> "$CHEMIN"stats.csv
git log --pretty=format:"%cn"   | sort | uniq  | tr -d ‘ ‘ > "$CHEMIN"commiters.csv

echo ' Nombre total des commits au projet : ' >> "$CHEMIN"stats.csv

git log --oneline | wc -l | tr -d ‘ ‘ >> "$CHEMIN"stats.csv

echo Fin script extraction