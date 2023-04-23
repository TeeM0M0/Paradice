import 'package:flutter/material.dart';
import 'dart:async';

//permet la création du splashscreen au lancement de l'application
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

//splashscreen de 3 secondes avec le logo et un CircularProgressIndicator qui renvoie sur la page d'acceuil
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Acceuil())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Stack(
        children: [
          Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 200),
            child: Image.asset(
              'Assets/Images/paradice_logo.png',
              width: 350,
            ),
          )),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 350.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//page d'acceuil avec un menu de navigation et deux boutons qui renvoit soit sur la page statistique ou personnalisé
class Acceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Center(
              child: DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.green),
                ),
              ),
            ),
            Center(
              child: ListTile(
                title: Text(
                  'Accès aux statistiques',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/statistiques');
                },
              ),
            ),
            Center(
              child: ListTile(
                title: Text('Accès aux dés personnalisés',
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.green)),
                onTap: () {
                  Navigator.pushNamed(context, '/personalise');
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.green,
                  child: Image.asset(
                    'Assets/Images/paradice_logo.png',
                    width: 350,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              child: const Text('Accès aux statistiques'),
              onPressed: () {
                Navigator.pushNamed(context, '/statistiques');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              child: const Text('Accès aux dés personnalisés'),
              onPressed: () {
                Navigator.pushNamed(context, '/personalise');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
