# DOCKER - WWW

- "1000:1000" correspond à l'UID et au GID de l'utilisateur sur votre système hôte. Vous pouvez remplacer ces valeurs par celles de votre utilisateur sur votre système hôte.

```
id -u
id -g
```

### Build

- **Étape 1 :** Téléchargez les projets suivants :
  - [cp-symfony](https://github.com/itd3vbox/project-cp-symfony)
  - [cp-webpack](https://github.com/itd3vbox/project-cp-webpack)

- **Étape 2 :** Modifiez le fichier `.env` et adaptez les variables suivantes :
  - `CP_SYMFONY` et `CP_WEBPACK` pour qu'ils correspondent aux emplacements des projets précédents (utilisez des chemins absolus ou exécutez `pwd` pour obtenir le chemin actuel).

- **Étape 3 :** Ajoutez la ligne suivante à votre fichier `/etc/hosts` :

```
127.0.0.1   cp.demo

```

- **Étape 4 :** Installez Docker, puis exécutez la commande `make`.

- **Étape 5 :** Dans la partie "Containers" de Docker, sélectionnez le conteneur nommé 'www-web', sur l' onglet choisissez 'Exec'. Une fois lancé, exécutez les commandes suivantes :

```
bash
cd /var/www/cp-symfony/
composer install
``` 

- **Étape 6 :** Une fois les conteneurs Docker démarrés, accédez à `http://cp.demo/` dans votre navigateur pour voir l'application en cours d'exécution.


