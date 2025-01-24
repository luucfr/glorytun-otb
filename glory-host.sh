# Variables
HOST="188.165.221.166" # Adresse IP du listener glorytun
PORT="5000" # Port du listener glorytun (5000 par défaut)
KEYFILE="/gt.key" # Chemin vers le fichier de clé partagée (doit être le même que celui utilisé par le listener)

# Script pour lancer Glorytun en boucle

while true; do
    echo "Démarrage de Glorytun avec l'adresse $HOST sur le port $PORT..."
    glorytun host $HOST port $PORT keyfile $KEYFILE

    echo "Glorytun s'est arrêté. Redémarrage dans 1 seconde..."
    sleep 1
done
