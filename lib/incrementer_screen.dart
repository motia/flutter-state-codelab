import 'package:flutter/material.dart';


class IncrementerScreen extends StatefulWidget {
  @override
  _IncrementerScreenState createState() => _IncrementerScreenState();
}

class _IncrementerScreenState extends State<IncrementerScreen> {
  int _count = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Incrementer',
        ),
      ),
      body: Center(
        child: Text(
          '$_count',
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}
