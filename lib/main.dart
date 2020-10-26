import 'package:flutter/material.dart';

import 'Views/product_list.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FSales',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ProductList(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales App'),
      ),
      body: Container(),
    );
  }
}
