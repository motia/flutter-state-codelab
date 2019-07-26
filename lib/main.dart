import 'package:flutter/material.dart';

import './cart_screen.dart';
import './pizzas.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select pizzas!'),
        actions: <Widget>[
          IconButton(
            onPressed: _navigateToCarScreen,
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
          child: ListView.builder(
        itemCount: PIZZAS.length,
        itemBuilder: (ctx, index) {
          final itemName = PIZZAS[index];
          final pizzaImage = HSLColor.fromAHSL(
            1,
            (index % 20) / 20 * 360,
            0.5,
            0.5,
          ); // A piz
          final isSelected = index % 3 == 0; // za color because they don't all
          // look the
          // same
          return ListTile(
            leading: Container(
              height: 48,
              width: 48,
              color: pizzaImage.toColor(),
            ),
            title: Text(itemName),
            trailing: FlatButton(
              onPressed: () {},
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Text('ADD',
                      style: TextStyle(color: Theme.of(context).accentColor)),
            ),
          );
        },
      )),
    );
  }

  void _navigateToCarScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => CartScreen(),
        ));
  }
}
