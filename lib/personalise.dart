import 'package:flutter/material.dart';
import 'package:new_dice/diceXpool.dart';
import 'package:flutter/services.dart';

///Ce fichier crée la page personnalisé et permet de lancer des dés avec
///un nombre de face que l'on aura choisi. On peut aussi utiliser des dés
///prédèfini (D6,D10,D20,D100). Pour chaque pool de dé on aura le nombre de face,
///le nombre de dé dans le pool, le resultat de chaque dé dans le pool après le lancé
///et la moyenne de tout les resultats obtenue.

class Personalise extends StatefulWidget {
  @override
  _Personalise createState() => _Personalise();
}

class _Personalise extends State<Personalise> {
  final _formKey = GlobalKey<FormState>();
  //variable de sauvegarde pour la zone de texte
  String _valeurSaisie = "";
  //variable de sauvegarde pour les différents pool de dé
  List pool = [];

  ///fonction qui permet l'ajout d'un pool de dé 6 ou si il y a déjà un pool
  ///de dé 6 dans la List pool ajoute 1 dé dans le pool de dé 6.
  void _d6() {
    setState(() {
      if (inpool(6) == false) {
        pool.add(DiceXpool(6));
      } else {
        for (DiceXpool elem in pool) {
          if (elem.getnbface() == 6) {
            elem.addDice();
          }
        }
      }
    });
  }

  ///fonction qui permet l'ajout d'un pool de dé 10 ou si il y a déjà un pool
  ///de dé 10 dans la List pool ajoute 1 dé dans le pool de dé 10.
  void _d10() {
    setState(() {
      if (inpool(10) == false) {
        pool.add(DiceXpool(10));
      } else {
        for (DiceXpool elem in pool) {
          if (elem.getnbface() == 10) {
            elem.addDice();
          }
        }
      }
    });
  }

  ///fonction qui permet l'ajout d'un pool de dé 20 ou si il y a déjà un pool
  ///de dé 20 dans la List pool ajoute 1 dé dans le pool de dé 20.
  void _d20() {
    setState(() {
      if (inpool(20) == false) {
        pool.add(DiceXpool(20));
      } else {
        for (DiceXpool elem in pool) {
          if (elem.getnbface() == 20) {
            elem.addDice();
          }
        }
      }
    });
  }

  ///fonction qui permet l'ajout d'un pool de dé 100 ou si il y a déjà un pool
  ///de dé 100 dans la List pool ajoute 1 dé dans le pool de dé 100.
  void _d100() {
    setState(() {
      if (inpool(100) == false) {
        pool.add(DiceXpool(100));
      } else {
        for (DiceXpool elem in pool) {
          if (elem.getnbface() == 100) {
            elem.addDice();
          }
        }
      }
    });
  }

  ///fonction qui permet l'ajout d'un pool de dé de nombre de face choisi
  ///ou si il y a déjà un pool de dé correspondant  dans la List pool ajoute 1 dé dans celui-ci.
  void _dX(nb) {
    setState(() {
      if (inpool(nb) == false) {
        pool.add(DiceXpool(nb));
      } else {
        for (DiceXpool elem in pool) {
          if (elem.getnbface() == nb) {
            elem.addDice();
          }
        }
      }
    });
  }

  //fonction qui permet de lancer les dés dans tous les pool contenue dans la List pool
  void _pool() {
    setState(() {
      for (DiceXpool elem in pool) {
        elem.add_resultat();
      }
    });
  }

  //fonction qui verifie si un pool de dé est déjà dans la List de pool, si oui retourne true sinon false
  bool inpool(nb) {
    for (var elem in pool) {
      if (elem.getnbface() == nb) {
        return true;
      }
    }
    return false;
  }

  //fonction qui permet de vider complètement le pool de dé
  void viderpool() {
    setState(() {
      pool = [];
    });
  }

  //fonction qui permet l'affichage des boutons de dé prédèfini ainsi que le bouton pour vider le pool et lancer les dés
  Widget affichagede() {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
          ElevatedButton(
            onPressed: _d6,
            child: const Text(
              'D6',
              style: TextStyle(color: Colors.green),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
              elevation: MaterialStateProperty.resolveWith((states) => 8),
            ),
          ),
          ElevatedButton(
            onPressed: _d10,
            child: const Text(
              'D10',
              style: TextStyle(color: Colors.green),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
              elevation: MaterialStateProperty.resolveWith((states) => 8),
            ),
          ),
          ElevatedButton(
            onPressed: _d20,
            child: const Text(
              'D20',
              style: TextStyle(color: Colors.green),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
              elevation: MaterialStateProperty.resolveWith((states) => 8),
            ),
          ),
          ElevatedButton(
            onPressed: _d100,
            child: const Text(
              'D100',
              style: TextStyle(color: Colors.green),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
              elevation: MaterialStateProperty.resolveWith((states) => 8),
            ),
          ),
        ]),
        const Padding(padding: EdgeInsets.all(5)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
          ElevatedButton(
            onPressed: viderpool,
            child: const Text(
              'Vider le pool de dés',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
              elevation: MaterialStateProperty.resolveWith((states) => 8),
            ),
          ),
          ElevatedButton(
            onPressed: _pool,
            child: const Text(
              'Lancer les dés',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.green),
              elevation: MaterialStateProperty.resolveWith((states) => 8),
            ),
          ),
        ])
      ],
    );
  }

  ///fonction qui renvoie l'affichage des résultats de chaque pool après avoir
  ///lancé les dés sinon affiche juste les différents pool de dé avec les
  ///résultats et moyennes initialisé à 0.
  Widget affichage() {
    Column nbface = Column(children: <Widget>[]);
    Column nbde = Column(children: <Widget>[]);
    Column resultat = Column(children: <Widget>[]);
    Column moyenne = Column(children: <Widget>[]);
    Column col = Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[nbface, nbde, resultat, moyenne])
    ]);
    for (DiceXpool elem in pool) {
      nbface.children.add(Text(elem.getnbface().toString()));
      nbde.children.add(Text(elem.getpool().length.toString()));
      resultat.children.add(Text(elem.getresultat().toString().substring(1, elem.getresultat().toString().length - 1)));
      moyenne.children.add(Text(elem.moyenne().toString()));
    }
    col.children.add(
      const Padding(padding: EdgeInsets.all(5)),
    );
    return SingleChildScrollView(
      child: col,
    );
  }

  ///corps de la page dans laquelle on retrouve la zone de texte pour ajouter un
  ///dé avec un nombre de face choisi, les boutons de la fonction affichagede et
  ///les différents pools de dé et resultats grâce à la fonction affichage.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Personnalisé'),
        ),
        body: Column(children: <Widget>[
          Container(
            color: Colors.green,
            child: Image.asset(
              'Assets/Images/paradice_logo.png',
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(5)
                      ],
                      decoration: const InputDecoration(labelText: "Nombre de faces"),
                      validator: (valeur) {
                        if (valeur == null || valeur.isEmpty) {
                          return "Entrez un nombre entier";
                        } else {
                          _valeurSaisie = valeur.toString();
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _dX(int.parse(_valeurSaisie));
                        }
                      },
                      child: const Text("Ajouter le dé")),
                ],
              )),
          const Padding(padding: EdgeInsets.all(5)),
          affichagede(),
          const Padding(padding: EdgeInsets.all(3)),
          Divider(),
          const Padding(padding: EdgeInsets.all(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Les résultats :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Text("Nb faces"), Text("Nb dés"), Text("Résultats"), Text("Moyenne")]),
          const Padding(padding: EdgeInsets.all(3)),
          SingleChildScrollView(
              child: Container(
            height: 200,
            child: affichage(),
          )),
        ]));
  }
}
