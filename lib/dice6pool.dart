import 'dicepool.dart';
import 'dice6.dart';

class Dice6pool extends Dicepool {
  ///La classe Dice6pool est une classe fille de Dicepool elle permet la création
  ///d'un pool de dé à 6 face uniquement

  //constructeur
  Dice6pool() : super();

//cette methode permet d'ajouter au pool un dé à 6 face à chaque appel de cette derniere.
  @override
  void addDice() {
    super.getpool().add(D6());
  }
}
