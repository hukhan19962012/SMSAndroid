import 'dart:convert';
import 'dart:async';
import 'package:SMSAndroid/models/product.dart';
import 'package:SMSAndroid/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/product_category/index.dart';
import 'package:http/http.dart' as http;

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
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ],
        ),
        body: ProductCategoryScreen(
          productCategoryBloc: _productCategoryBloc,
          pageNumber: pageNumber,
        ));
  }
}

class DataSearch extends SearchDelegate<Product> {
  ProductRepository _productRepository = ProductRepository();
  Future<List<Product>> listProduct(String search) async {
    return _productRepository.getProducts(search);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //acction Appbar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of this app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {});
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result base on selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: listProduct(query),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(snapshot.data[index].img),
                title: Text(snapshot.data[index].name),
              ),
              itemCount: snapshot.data.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
