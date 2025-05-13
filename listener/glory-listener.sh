#!/bin/bash

PORT="5000" # Port du listener glorytun (5000 par défaut)
KEYFILE="./gt.key" # Chemin vers le fichier de clé partagée (doit être le même que celui utilisé par le host)
IP_ADDRESS="10.0.0.1/24" # Adresse IP local TUN du listener glorytun
TUN_INTERFACE="tun0" # Nom de l'interface TUN
PUBLIC_INTERFACE="ens3" # Nom de l'interface publique
PUBLIC_IP="51.68.92.34" # Adresse IP publique

while true; do
    echo "Démarrage de Glorytun listener..."

    # Démarrer Glorytun listener
    glorytun listener port $PORT keyfile $KEYFILE debug &

    # Vérifier si l'interface tun0 existe
    if ip link show $TUN_INTERFACE &>/dev/null; then
        # Attribuer l'adresse IP à l'interface tun0
        ip addr add $IP_ADDRESS dev $TUN_INTERFACE

        # Activer l'interface tun0
        ip link set $TUN_INTERFACE up

        # Configurer le NAT (masquage d'adresse) pour que le trafic sorte via eno1
        sudo iptables -t nat -A POSTROUTING -o $PUBLIC_INTERFACE -j MASQUERADE

        echo "Adresse IP $IP_ADDRESS assignée et l'interface $TUN_INTERFACE activée."
        echo "Routage et NAT configurés pour diriger le trafic sortant via $PUBLIC_INTERFACE ($PUBLIC_IP)."
    else
        echo "L'interface $TUN_INTERFACE n'a pas été trouvée. Essai dans 1 seconde..."
    fi

    # Attendre que Glorytun se termine, puis redémarrer
    wait
    echo "Glorytun listener s'est arrêté. Redémarrage dans 1 seconde..."
    sleep 1
done
