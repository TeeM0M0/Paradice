import 'dart:math';

///cette classe abstaite Dice est le "model" pour créer des dé de
///nombre de face differant comme avec les classes fille dice6,dice10...
///elle posséde 2 attributs privés _nbface et _resultatface.

abstract class Dice {
  //attribut
  int _nbFace;
  int _resultatFace = 0;

  //constructeur
  Dice(this._nbFace);

  //getter et setter

  //retourne le nombre de face du dé
  int getNbFace() {
    return this._nbFace;
  }

  //retoune le resultat de la face , si il n'y a pas eu de lancer retourne 1
  int getResultatFace() {
    return this._resultatFace;
  }

  //autre methode

  ///permet de lancer le dé et sauvegardera le resultat dans l'attribut _resultatFace
  ///le resultat sera compris entre 1 et le nombre de face compris.
  void lancede() {
    Random random = new Random();
    this._resultatFace = random.nextInt(this._nbFace) + 1;
  }
}
