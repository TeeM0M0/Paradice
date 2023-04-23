import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';
import 'package:new_dice/dice20pool.dart';
import 'package:new_dice/dicepool.dart';
import 'dice10pool.dart';
import 'dice6pool.dart';

///Ce fichier crée la page statistiques et permet de lancer des dés avec
///un nombre de face prédèfini (D6,D10,D20,D100). On peut ajouter ou enlever des
///dés dans le pool à l'aide des boutons d'ajouts et de supressions(-10,-1,1,+1,+10)
///Pour chaque pool de dé on aura le nombre de fois où le dé est tombé sur chaque face
///et la moyenne de tout les resultats obtenue.

class Statistiques extends StatefulWidget {
  @override
  _Statistiques createState() => _Statistiques();
}

class _Statistiques extends State<Statistiques> {
  //variable de sauvegarde pour savoir le nombre de dé dans le pool.
  int _counter = 1;

  //variable de sauvegarde pour definir le pool de dé choisi
  Dicepool pool = Dice6pool();

  //variable de sauvegarde pour le type de dé du pool
  String info_dice = "6";

  //variable de sauvegarde pour les résultats de chaque dé après le lancé.
  List resultat_pool = [];

  ///fonction qui permet l'ajout d'un dé dans le pool de dé.
  void _add1() {
    setState(() {
      pool.addDice();
      _counter++;
    });
  }

  ///fonction qui permet l'ajout de 10 dés dans le pool de dé.
  void _add10() {
    setState(() {
      for (int i = 0; i < 10; i++) {
        pool.addDice();
      }
      _counter += 10;
    });
  }

  ///fonction qui permet la suppression d'un dé dans le pool de dé.Si le nombre de dé dans le pool -1 est inferieur à 1 alors le nombre de dé sera égal à 1.
  void _supp1() {
    if (_counter - 1 < 1) {
      setState(() {
        _counter = 1;
      });
    } else {
      setState(() {
        pool.delDice();
        _counter--;
      });
    }
  }

  ///fonction qui permet la suppression  de 10 dés dans le pool de dé.Si le nombre de dé dans le pool -10 est inferieur à 1 alors le nombre de dé sera égal à 1.
  void _supp10() {
    if (pool.getpool().length > 10) {
      for (int i = 0; i < 10; i++) {
        pool.delDice();
      }
    }
    if (_counter - 10 < 1) {
      setState(() {
        _counter = 1;
      });
    } else {
      setState(() {
        _counter -= 10;
      });
    }
  }

  ///fonction qui clear le pool de dé et l'initialise
  ///avec 1 seul dé.
  void _reset() {
    setState(() {
      pool.resetpool();
      _counter = 1;
    });
  }

  ///fonction qui permet d'initialiser le pool comme
  ///un pool de dé 6
  void _d6() {
    setState(() {
      info_dice = "6";
      pool = Dice6pool();
    });
  }

  ///fonction qui permet d'initialiser le pool comme
  ///un pool de dé 10
  void _d10() {
    setState(() {
      info_dice = "10";
      pool = Dice10pool();
    });
  }

  ///fonction qui permet d'initialiser le pool comme
  ///un pool de dé 20
  void _d20() {
    setState(() {
      info_dice = "20";
      pool = Dice20pool();
    });
  }

  ///fonction qui permet d'initialiser le pool comme
  ///un pool de dé 100
  void _d100() {
    setState(() {
      info_dice = "100";
      pool = Dice10pool();
    });
  }

  ///fonction qui permet de lancer les dés dans le pool et renvoie les resultats
  ///dans la List resultat_pool.
  void _pool() {
    pool.add_resultat();
    resultat_pool = pool.getresultat();
    setState(() {});
  }

  ///fonction qui renvoie l'affichage des résultats après chaque
  ///lancé des dés sinon affiche les résultats de chaque face et moyennes initialisé à 0.
  Widget affichage() {
    Column col = Column(children: <Widget>[]);
    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[]);
    for (int i = 1; i <= int.parse(info_dice); i++) {
      if (i % 2 == 0) {
        row.children.add(Text("Nombre de $i : " + pool.count_dice_idem(i).toString()));
        col.children.add(row);
        row = Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[]);
      } else if (i % 2 != 0 && i == int.parse(info_dice)) {
        row.children.add(Text("Nombre de $i : " + pool.count_dice_idem(i).toString()));
        col.children.add(row);
        row = Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[]);
      } else {
        row.children.add(Text("Nombre de $i : " + pool.count_dice_idem(i).toString()));
      }
    }
    col.children.add(
      const Padding(padding: EdgeInsets.all(5)),
    );
    return SingleChildScrollView(
      child: col,
    );
  }

  ///fonction qui permet l'affichage des boutons de dé prédèfini qui permettent
  ///de choisir le type de dé voulu
  Widget affichagede() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
      ElevatedButton(
        onPressed: _d6,
        child: const Text(
          'D6',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
          elevation: MaterialStateProperty.resolveWith((states) => 8),
        ),
      ),
      ElevatedButton(
        onPressed: _d10,
        child: const Text(
          'D10',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
          elevation: MaterialStateProperty.resolveWith((states) => 8),
        ),
      ),
      ElevatedButton(
        onPressed: _d20,
        child: const Text(
          'D20',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
          elevation: MaterialStateProperty.resolveWith((states) => 8),
        ),
      ),
      ElevatedButton(
        onPressed: _d100,
        child: const Text(
          'D100',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
          elevation: MaterialStateProperty.resolveWith((states) => 8),
        ),
      ),
    ]);
  }

  ///fonction qui permet l'affichage des boutons de modification de dé qui
  ///permet de d'ajouter et  supprimer des dés dans le pool ou de reset le pool
  Widget affichagemodifde() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ElevatedButton(
          onPressed: _supp10,
          child: const Text(
            '-10',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
            elevation: MaterialStateProperty.resolveWith((states) => 8),
          ),
        ),
        ElevatedButton(
          onPressed: _supp1,
          child: const Text(
            '-1',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
            elevation: MaterialStateProperty.resolveWith((states) => 8),
          ),
        ),
        ElevatedButton(
          onPressed: _reset,
          child: const Text(
            '1',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
            elevation: MaterialStateProperty.resolveWith((states) => 8),
          ),
        ),
        ElevatedButton(
          onPressed: _add1,
          child: const Text(
            '+1',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
            elevation: MaterialStateProperty.resolveWith((states) => 8),
          ),
        ),
        ElevatedButton(
          onPressed: _add10,
          child: const Text(
            '+10',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
            elevation: MaterialStateProperty.resolveWith((states) => 8),
          ),
        ),
      ],
    );
  }

  ///fonction qui permet l'affichage du type de dé choisi et du nombre de dé dans le pool
  Widget affichageNbDe() {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Text(
            "Nombre de D$info_dice : ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "$_counter",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
          )
        ],
      ),
    );
  }

  ///corps de la page dans laquelle on retrouve les differents boutons pour
  ///choisir son type de dé et ajouter ou supprimer des dés du pool,
  ///les résultats des dés et la moyenne grâce à la fonction affichage.
  ///et le bouton qui permet de lancer les dés
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Statistiques")),
      body: Column(children: <Widget>[
        Container(
          color: Colors.green,
          child: Image.asset(
            'Assets/Images/paradice_logo.png',
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        affichagede(),
        const Padding(padding: EdgeInsets.all(5)),
        affichagemodifde(),
        const Padding(padding: EdgeInsets.all(5)),
        affichageNbDe(),
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          children: [
            Text("Mes resultats :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
        SingleChildScrollView(
            child: Container(
          height: 100,
          child: affichage(),
        )),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Moyenne obtenue : "),
            Text(
              pool.moyenne().toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _pool,
        tooltip: 'Increment',
        child: const Icon(DiceIcons.dice5),
      ),
    );
  }
}
