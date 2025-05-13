#!/bin/bash

# Script pour installer Glorytun sur un système Linux

# Variables
GLORYTUN_VERSION="v0.0.35"
GLORYTUN_BIN_URL="https://github.com/angt/glorytun/releases/download/$GLORYTUN_VERSION/glorytun-0.0.35-x86_64.bin"
GLORYTUN_BIN_PATH="/bin/glorytun"
KEYFILE_PATH="gt.key"

# Fonction pour afficher un message d'erreur et quitter
function error_exit {
    echo "$1" 1>&2
    exit 1
}

# Mettre à jour les paquets
echo "Mise à jour des paquets..."
apt update -y || error_exit "Échec de la mise à jour des paquets."

# Installer curl si ce n'est pas déjà installé
echo "Installation de curl si nécessaire..."
apt install -y curl || error_exit "Échec de l'installation de curl."

# Télécharger le binaire de Glorytun
echo "Téléchargement de Glorytun..."
curl -L -o /tmp/glorytun.bin $GLORYTUN_BIN_URL || error_exit "Échec du téléchargement de Glorytun."

# Déplacer le binaire vers /bin et changer les permissions
echo "Déplacement du binaire et attribution des permissions..."
mv /tmp/glorytun.bin $GLORYTUN_BIN_PATH || error_exit "Échec du déplacement du binaire."
chmod +x $GLORYTUN_BIN_PATH || error_exit "Échec de l'attribution des permissions au binaire."

# Finalisation
echo "Installation de Glorytun terminée. Le binaire est installé sous $GLORYTUN_BIN_PATH."
echo "La clé de configuration est disponible sous $KEYFILE_PATH."
