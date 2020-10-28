import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

class ProductPage extends StatefulWidget {
  static const String routeName = '/product';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _productBloc = ProductBloc(UnProductState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: ProductScreen(productBloc: _productBloc),
    );
  }
}