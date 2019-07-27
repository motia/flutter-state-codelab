import 'package:flutter/material.dart';
import './pizzas.dart';
import 'cart_screen.dart';

class ShoppingScreen extends StatefulWidget {
  ShoppingScreen({Key key}) : super(key: key);

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  Set<String> selectedPizzas = {};
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
              final pizzaName = PIZZAS[index];
              final pizzaImage = HSLColor.fromAHSL(
                1,
                (index % 20) / 20 * 360,
                0.5,
                0.5,
              ); // A piz
              final isSelected = selectedPizzas.contains(pizzaName); // za color because they don't
              // all
              // look the
              // same
              return ListTile(
                leading: Container(
                  height: 48,
                  width: 48,
                  color: pizzaImage.toColor(),
                ),
                title: Text(pizzaName),
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
