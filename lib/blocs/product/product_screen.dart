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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.productResponse.products.toString()),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._productBloc.add(LoadProductEvent());
  }
}
