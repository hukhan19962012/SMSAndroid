import 'package:SMSAndroid/models/product.dart';
import 'package:SMSAndroid/repository/product_repository.dart';
import 'package:flutter/material.dart';

class DataProductSearch extends SearchDelegate<Product> {
  ProductRepository _productRepository = ProductRepository();
  FocusNode _focusNode;
  Future<List<Product>> listProduct(String search) async {
    return _productRepository.getProducts(search);
  }

  Future<Product> product(int id) async {
    return _productRepository.getProduct(id);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //acction Appbar

    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of this app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      query = "1";
    }
    return Center(
        child: FutureBuilder<Product>(
            future: product(int.parse(query)),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Center(
                    child: Column(
                  children: [
                    Container(
                      child: Image.network(snapshot.data.img),
                    ),
                    Container(
                      child: Text(snapshot.data.name),
                    )
                  ],
                ));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: listProduct(query),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  query = snapshot.data[index].id.toString();
                  showResults(context);
                },
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data[index].img)),
                title: Text(snapshot.data[index].name),
              ),
              itemCount: snapshot.data.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
