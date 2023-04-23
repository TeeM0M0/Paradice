import 'dicepool.dart';
import 'dice20.dart';

///La classe Dice20pool est une classe fille de Dicepool elle permet la création
///d'un pool de dé à 20 face uniquement
class Dice20pool extends Dicepool {
  //constructeur
  Dice20pool() : super();

  //methodes

  //cette methode permet d'ajouter au pool un dé à 20 face à chaque appel de cette derniere.
  @override
  void addDice() {
    super.getpool().add(D20());
  }
}
