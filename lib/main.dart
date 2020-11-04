import 'package:flutter/material.dart';

import 'blocs/product/product_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FSales',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ProductPage(),
    );
  }
}
