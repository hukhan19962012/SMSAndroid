import 'package:SMSAndroid/views/home_page.dart';
import 'package:flutter/material.dart';

import 'blocs/product/product_page.dart';

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
      home: ProductPage(),
    );
  }
}
