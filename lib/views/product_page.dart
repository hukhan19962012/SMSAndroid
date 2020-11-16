import 'package:SMSAndroid/blocs/product_category/product_category_page.dart';
import 'package:flutter/material.dart';

class ProductMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: ProductCategoryPage(
        pageNumber: 1,
      ),
    );
  }
}
