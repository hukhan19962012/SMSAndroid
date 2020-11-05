import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/product_category/index.dart';

class ProductCategoryPage extends StatefulWidget {
  static const String routeName = '/productCategory';

  @override
  _ProductCategoryPageState createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  final _productCategoryBloc = ProductCategoryBloc(UnProductCategoryState());

  @override
  Widget build(BuildContext context) {
    return ProductCategoryScreen(productCategoryBloc: _productCategoryBloc);
  }
}
