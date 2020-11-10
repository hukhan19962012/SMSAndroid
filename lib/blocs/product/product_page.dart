import 'package:SMSAndroid/models/product.dart';
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {
                    showSearch(context: context, delegate: )
                  })
        ],
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
  class DataSearch extends SearchDelegate<Product>{
  @override
  List<Widget> buildActions(BuildContext context) {
      // TODO: implement buildActions
      throw UnimplementedError();
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // TODO: implement buildLeading
      throw UnimplementedError();
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
    
  }