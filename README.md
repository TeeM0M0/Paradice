# Paradice

Paradice est une application codée en Flutter dans le cadre de mes études en BTS SIO option SLAM.
Cette application permet de lancer des dés, qu'il soit personnalisé ou déjà créée et de récupérer les résultats 
et statistiques des différents lancés.

## Fonctionnement

L'application démarre sur un splash Screen de 3 s, on est ensuite redirigé sur la page d'accueil sur laquelle se trouvent les boutons pour accéder 
aux autres pages soit les statistiques ou les dés personnalisés. Et un menu déroulant  qui amène aux même autres pages.

![partie1](paradice_img/partie1.png)

### Page statistiques :

Sur la page statistique, vous avez accès à différents dés : D6, D10, D20 et D100. Au lancement de la page un D6 est initialisé mais il est possible de le changer avec les boutons prévus à cet effet. Une fois le de et la quantité choisie vous pouvez appuyer sur le bouton D5 en bas à droite de l'écran pour lancer le/les dé(s) et les résultats et statistiques du Lancé s'afficheront.

Les statistiques affichés seront :

1. Le nombre de chaque faces sur lequel le ou les dés sont tombés
2. La moyenne des résultats de chaque dés lancé

![stat](paradice_img/stat.PNG)

### Page personnalisé :

Sur la page personnalisé l'utilisateur à toujours le choix entre les D6, D10, D20 et D100 mais à aussi la possibilité de créer un dé personnalisé avec un nombre de faces souhaiter. L'utilisateur pourra toujours rajouter des dés soit en appuyant sur les boutons D6, D10... pour les dés prédéfinis et sur le bouton "Ajouter le dé" pour les dés personnalisés. Une fois les dés choisis il pourra les lancer grâce au bouton "Lancer les dés" ce qui affichera les informations et résultats du lancé.

Les informations et résultats affichés seront :

1. Le nombre de face
2. Le nombre de dés
3. Les résultats du lancé
4. La moyenne des resultats du lancé

L'utilisateur a aussi la possibilité de vider le pool de dés avec le bouton prévu à cet effet.

![perso](paradice_img/eprso.PNG)

## Les fichiers

### Dice.dart 

Dice est une classe abstraite qui sert de "modèle" pour créer des dés de nombre de faces différant comme avec les classes fille dice6, dice10... 
Elle possède 2 attributs privés _nbface qui sert à savoir le nombre de faces du dé et _resultatface qui est une variable qui sauvegarde le résultat du dé après chaque lancer.

### Dice6/10/20/100/X.dart 

Dice6/10/20/100/X sont des classes fille de Dice elles permettent la création de dé à 6/10/20/100/X faces (X étant un nombre choisi par l'utilisateur)

### Dicepool.dart

Dicepool est une classe abstraite qui sert de "modèle" pour créer des pools de dé différant comme avec les classes fille dice6pool, dice10pool...
Elle possède 2 attributs privés _pool qui est une List où sont stockés les dés et _résultat une List où sont stockés les résultats de chaque dé.

### Dice6/10/20/100/Xpool.dart 

Dice6/10/20/100/Xpool sont des classes fille de Dicepool elles permettent la création d'un pool de  dé à 6/10/20/100/X faces uniquement. (X étant un nombre choisi par l'utilisateur)

## Video presentation du projet :

[![Watch the video](paradice_img/video.png)](https://youtu.be/rgmf_-vSd5Q)
