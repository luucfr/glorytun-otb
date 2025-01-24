## Installation

### Pour installer glorytun listener, exécutez les commandes suivantes :
#### Installation de glorytun et génération de clé (sur serveur listener) :
```bash
curl -sSL https://github.com/luucfr/glorytun-otb/raw/main/install_glorytun.sh -o install_glorytun.sh
chmod +x install_glorytun.sh
sudo ./install_glorytun.sh
```

#### Installation et démarrage du listener (sur serveur listener) :
```bash
curl -sSL https://github.com/luucfr/glorytun-otb/raw/main/glory-listener.sh -o glory-listener.sh
chmod +x glory-listener.sh
./glory-listener.sh
```

### Pour installer glorytun host, exécutez les commandes suivantes :
#### Installation et démarrage du host (sur OTB) :
```bash
curl -sSL https://github.com/luucfr/glorytun-otb/raw/main/glory-listener.sh -o glory-host.sh
chmod +x glory-host.sh
./glory-host.sh
```