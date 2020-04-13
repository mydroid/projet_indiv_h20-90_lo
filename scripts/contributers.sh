#!/usr/bin/env bash
# A utiliser dans le dossier racine du projet 
# CHEMIN doit etre indiquer comme 1 parametre - la place désiré a mettre les rapports

#declare CHEMIN="/drives/c/MyFolder/univer2/mgl7460/stats"

CHEMIN=$1

echo Debut traitement 

# Extraction
./extract.sh $CHEMIN

# Script pour l'etape d'analyse d'auteurs
./authors.sh $CHEMIN

# Script pour l'etape d'analyse de commiters
./commiters.sh $CHEMIN

# Script pour l'etape d'extraction de la date du derniere commit par commiteur
./commiters_last_commit_date.sh $CHEMIN

# Script pour l'etape d'extraction de la date du premiere commit par commiteur
./commiters_first_commit_date.sh $CHEMIN

echo Fin traitement. Vous pouvez analyser les donnees.
