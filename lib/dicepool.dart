import 'dice.dart';

///cette classe abstaite Dicepool est le "model" pour créer des pool de dé
/// differant comme avec les classes fille dice6pool,dice10pool...
///elle posséde 2 attributs privés _pool et _resultat.

abstract class Dicepool {
  //attributs
  List<Dice> _pool = [];
  List _resultat = [];

  //constructeur
  Dicepool() {
    addDice();
    resultatbase();
  }

  //getter et setter

  //retourne les resultats des dés du pool
  List getresultat() {
    return this._resultat;
  }

  //retourne les dés du pool
  List getpool() {
    return this._pool;
  }

  //autres methodes

  //methode abstraite qui permet d'ajouter un dé dans le pool
  void addDice();

  //methode qui permet de supprimer un dé dans le pool
  void delDice() {
    this._pool.removeAt(0);
  }

  //methode qui permet de reset le pool et lui ajouter un dé
  void resetpool() {
    this._pool = [];
    addDice();
  }

  //methode qui permet de reset les résultats dans la List _resultat
  void resetresult() {
    this._resultat = [];
  }

  //methode qui permet d'ajouter les resultats des lancés dans la List _resultat
  void add_resultat() {
    this.resetresult();
    for (Dice elem in _pool) {
      elem.lancede();
      this._resultat.add(elem.getResultatFace());
    }
  }

  ///methode qui permet d'initialiser le resultat du dé dans la List _resultat
  ///ex: à l'ajout du dé dans le pool _resultatface initialisé à 0 est ajouté dans
  ///la List _resultat (methode créée principalement pour les dés personalisés )
  void resultatbase() {
    this.resetresult();
    for (Dice elem in _pool) {
      this._resultat.add(elem.getResultatFace());
    }
  }

  //methode qui compte le nombre d'occurence d'un nombre mis en paramettre dans la List _resultat
  int count_dice_idem(int nb) {
    int k = 0;
    for (int elem in this._resultat) {
      if (elem == nb) {
        k++;
      }
    }
    return k;
  }

  //methode qui renvoie la moyenne des resultats de la List _resultat arrondi au centième
  double moyenne() {
    double moy = 0;
    for (int elem in this._resultat) {
      moy += elem;
    }
    moy /= this._resultat.length;
    return double.parse(moy.toStringAsFixed(2));
  }
}
