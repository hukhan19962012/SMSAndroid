import 'package:SMSAndroid/models/product.dart';
import 'package:SMSAndroid/repository/product_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('pageNumber', pageNumber));
  }
}
