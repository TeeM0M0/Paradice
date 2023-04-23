import 'package:flutter/material.dart';
import 'myhomepage.dart';
import 'statistique.dart';
import 'personalise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paradice',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Accueil'),
      routes: <String, WidgetBuilder>{
        '/acceuil': (BuildContext context) => Acceuil(),
        '/statistiques': (BuildContext context) => Statistiques(),
        '/personalise': (BuildContext context) => Personalise(),
      },
    );
  }
}
