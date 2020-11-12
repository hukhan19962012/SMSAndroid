import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/product_category/index.dart';

class ProductCategoryPage extends StatefulWidget {
  static const String routeName = '/productCategory';
  final int pageNumber;
  final int companyId;

  const ProductCategoryPage({Key key, this.pageNumber, this.companyId})
      : super(key: key);

  @override
  _ProductCategoryPageState createState() =>
      _ProductCategoryPageState(this.pageNumber, this.companyId);
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  final int pageNumber;
  final int companyId;
  final _productCategoryBloc = ProductCategoryBloc(UnProductCategoryState());
  _ProductCategoryPageState(this.pageNumber, this.companyId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: null)
          ],
        ),
        body: ProductCategoryScreen(
          productCategoryBloc: _productCategoryBloc,
          pageNumber: pageNumber,
        ));
  }
}
