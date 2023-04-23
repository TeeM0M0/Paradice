import 'dicepool.dart';
import 'dice10.dart';

///La classe Dice10pool est une classe fille de Dicepool elle permet la création
///d'un pool de dé à 10 face uniquement

class Dice10pool extends Dicepool {
  //constructeur
  Dice10pool() : super();

  //methodes

  //cette methode permet d'ajouter au pool un dé à 10 face à chaque appel de cette derniere.
  @override
  void addDice() {
    super.getpool().add(D10());
  }
}
