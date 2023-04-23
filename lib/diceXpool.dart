import 'dicepool.dart';
import 'diceX.dart';

///La classe DiceXpool est une classe fille de Dicepool elle permet la création
///d'un pool de dé à nombre de face choisi uniquement

class DiceXpool extends Dicepool {
  //attribut
  int _nbface;

  //constructeur
  DiceXpool(this._nbface) : super();

  //getter et setter

  //retourne le nombre de face du type de dé du pool
  int getnbface() {
    return this._nbface;
  }

  //autres methodes

  //cette methode permet d'ajouter au pool un dé avec un nombre de face choisi à chaque appel de cette derniere.
  @override
  void addDice() {
    super.getpool().add(DX(this._nbface));
    resultatbase();
  }
}
