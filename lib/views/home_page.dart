import 'package:SMSAndroid/blocs/product/index.dart';
import 'package:SMSAndroid/blocs/product_category/product_category_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ProductCategoryPage(),
    );
  }
}
