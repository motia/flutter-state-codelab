import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pizzas.dart';
import 'cart_screen.dart';
import 'main.dart';

class ShoppingScreen extends StatefulWidget {
  ShoppingScreen({Key key}) : super(key: key);

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    var selectedPizzas = cart.selectedPizzasStream.value;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select pizzas!'),
        actions: <Widget>[
          StreamBuilder<Set<String>>(
            stream: cart.selectedPizzasStream,
            builder: (
              BuildContext context,
              AsyncSnapshot<Set<String>> snapshot,
            ) {
              if (!snapshot.hasData || snapshot.data.length == 0) {
                return SizedBox();
              }
              return IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: _navigateToCarScreen,
              );
            },
          ),
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
              // all
              // look the
              // same
              return PizzaTile(pizzaName, pizzaImage.toColor(),
                  selectedPizzas.contains(pizzaName), (b) {
                if (b) {
                  selectedPizzas.add(PIZZAS[index]);
                } else {
                  selectedPizzas.remove(PIZZAS[index]);
                }
              });
            }),
      ),
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

typedef ItemToggle = void Function(bool b);

class PizzaTile extends StatefulWidget {
  final String name;
  final Color image;
  final ItemToggle onPressed;
  final bool isSelected;

  PizzaTile(this.name, this.image, this.isSelected, this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return PizzaTileState();
  }
}

class PizzaTileState extends State<PizzaTile> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Container(
        height: 48,
        width: 48,
        color: widget.image,
      ),
      title: Text(widget.name),
      trailing: FlatButton(
        onPressed: () {
          setState(() {
            _selected = !_selected;
          });
          if (_selected) {
            Provider.of<Cart>(context).add(widget.name);
          } else {
            Provider.of<Cart>(context).remove(widget.name);
          }
        },
        child: _selected
            ? Icon(
                Icons.check,
                color: Colors.green,
              )
            : Text('ADD',
                style: TextStyle(color: Theme.of(context).accentColor)),
      ),
    );
  }
}
