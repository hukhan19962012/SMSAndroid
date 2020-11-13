import 'dart:convert';

import 'package:SMSAndroid/models/product.dart';
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
  Future<List<Product>> list() async {
    final response = await http
        .get("https://mysmsapi.azurewebsites.net/api/v1.0/Product/getAll");
    if (response.statusCode == 200) {
      print(json
          .decode(response.body)
          .map<Product>((item) => Product.fromJson(item))
          .toList()
          .toString());
      return json
          .decode(response.body)
          .map<Product>((item) => Product.fromJson(item))
          .toList();
    }
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
    final suggesstionList = query.isEmpty ? list() : list();
    List<Product> listProduct;
    suggesstionList
        .then((value) => value.forEach((item) => listProduct.add(item)));
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Image.network(listProduct[index].img),
        title: Text(listProduct[index].name),
      ),
    );
  }
}
