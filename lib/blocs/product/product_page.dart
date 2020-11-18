import 'package:SMSAndroid/blocs/product_category/product_category_page.dart';
import 'package:SMSAndroid/views/product_page.dart';
import 'package:SMSAndroid/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

import '../../main.dart';

class ProductPage extends StatefulWidget {
  static const String routeName = '/product';
  final int catId;
  final int pageNumber;
  ProductPage(
    this.catId,
    this.pageNumber,
  );
  @override
  _ProductPageState createState() =>
      _ProductPageState(this.catId, this.pageNumber);
}

class _ProductPageState extends State<ProductPage> {
  final _productBloc = ProductBloc();
  final int catId;
  final int pageNumber;

  _ProductPageState(this.catId, this.pageNumber);
  @override
  Widget build(BuildContext context) {
    int bottomBarIndex = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: ProductScreen(
        productBloc: _productBloc,
        catId: catId,
        pageNum: pageNumber,
      ),
    );
  }
}
