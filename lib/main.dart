import 'package:birmo_codelab/shopping_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ShoppingScreen(),
    );
  }
}
