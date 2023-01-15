import 'package:flutter/material.dart';
import 'package:pratikum4_1461900054/produkscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1461900054-Rizal Prambudi-PAGI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color:Colors.white), ),
      ),
      home: const Produkscreen(),
    );
  }
}

