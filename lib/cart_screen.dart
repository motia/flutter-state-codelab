import 'package:birmo_codelab/pizzas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int get totalPrice => 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My basket'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.all(16),
              child: StreamBuilder<Set<String>>(
                  stream: Provider
                      .of<Cart>(context)
                      .selectedPizzasStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      return SizedBox();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (snapshot.data).toList(growable: false).map(
                              (x) {
                        return Text(x);
                      }).toList(),
                    );
                  }
              ),
            ),
          ),
          Divider(),
          Container(
              height: 120,
              color: Theme
                  .of(context)
                  .accentColor,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$totalPrice DA',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  MaterialButton(
                    color: Colors.yellow.shade600,
                    onPressed: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
