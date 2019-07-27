import 'package:birmo_codelab/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';


void main() => runApp(MyApp());

class Cart {
  Set<String> selectedPizzas = {};

  BehaviorSubject<Set<String>> selectedPizzasStream;

  Cart () {
    selectedPizzasStream = BehaviorSubject<Set<String>>.seeded(selectedPizzas);
  }

  add (String s) {
    if(!selectedPizzas.contains(s)) {
      selectedPizzas.add(s);
    }
    selectedPizzasStream.add(selectedPizzas);
  }

  remove (s) {
    if(selectedPizzas.contains(s)) {
      selectedPizzas.remove(s);
    }
    selectedPizzasStream.add(selectedPizzas);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return Provider.value(
      value: Cart(),
      child: MaterialApp(
        title: 'Pizza shop',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ShoppingScreen(),
      ),
    );
  }
}
