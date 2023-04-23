import 'dicepool.dart';
import 'dice100.dart';

///La classe Dice100pool est une classe fille de Dicepool elle permet la création
///d'un pool de dé à 100 face uniquement
class Dice100pool extends Dicepool {
  //constructeur
  Dice100pool() : super();

  //methodes

  //cette methode permet d'ajouter au pool un dé à 20 face à chaque appel de cette derniere.
  @override
  void addDice() {
    super.getpool().add(D100());
  }
}
