import 'package:SMSAndroid/models/product.dart';
import 'package:SMSAndroid/models/product_response.dart';
import 'package:SMSAndroid/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key key,
    @required ProductBloc productBloc,
  })  : _productBloc = productBloc,
        super(key: key);

  final ProductBloc _productBloc;

  @override
  ProductScreenState createState() {
    return ProductScreenState();
  }
}

class ProductScreenState extends State<ProductScreen> {
  ProductScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
        cubit: widget._productBloc,
        builder: (
          BuildContext context,
          ProductState currentState,
        ) {
          if (currentState is UnProductState) {
            print("screen 2");
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorProductState) {
            print("screen 1");
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
          if (currentState is InProductState) {
            print("screen 3");
            return _buildListProduct(currentState.productResponse);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildListProduct(ProductResponse proRes) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(proRes.products[index].img),
                radius: 30,
              ),
              title: Text(
                proRes.products[index].name,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: Text(
                proRes.products[index].price.toString() + "\$",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              onTap: () => {_openMyPage(proRes.products[index])});
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
        itemCount: proRes.products.length);
  }

  void _openMyPage(Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => _singleItembuild(product)));
  }

  void _load() {
    widget._productBloc.add(LoadProductEvent());
  }

  Widget _singleItembuild(Product product) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.network(product.img),
                            Text(product.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(product.description),
                            Text("Price: " + product.price.toString() + "\$"),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}
