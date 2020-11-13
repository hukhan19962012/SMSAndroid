import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key key,
    @required ProductBloc productBloc,
    int propid,
  })  : _productBloc = productBloc,
        _propid = propid,
        super(key: key);

  final ProductBloc _productBloc;
  final int _propid;
  @override
  ProductDetailScreenState createState() {
    return ProductDetailScreenState(this._propid);
  }
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  int proId;
  ProductDetailScreenState(this.proId);

  @override
  void initState() {
    super.initState();
    _load(this.proId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
          cubit: widget._productBloc,
          builder: (
            BuildContext context,
            ProductState currentState,
          ) {
            if (currentState is UnProductState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (currentState is ErrorProductState) {
              var raisedButton = RaisedButton(
                  color: Colors.blue,
                  child: Text('reload'),
                  onPressed: () => {_load(this.proId)});
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.errorMessage ?? 'Error'),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: raisedButton,
                  ),
                ],
              ));
            }
            if (currentState is InProductState) {
              return Center(
                  child: Column(
                children: [
                  Container(
                    child: Image.network(currentState.product.img),
                  ),
                  Container(
                    child: Text(currentState.product.name),
                  )
                ],
              ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  void _load(int id) {
    widget._productBloc.add(LoadSingleProductEvent(id));
  }
}
