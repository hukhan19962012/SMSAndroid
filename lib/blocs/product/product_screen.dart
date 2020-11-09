import 'package:SMSAndroid/models/product_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key key,
    @required ProductBloc productBloc,
    this.catId,
    this.name,
    this.pageNum,
  })  : _productBloc = productBloc,
        super(key: key);

  final ProductBloc _productBloc;
  final int catId;
  final String name;
  final int pageNum;
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
    _load(1, 1, "");
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorProductState) {
            var raisedButton = RaisedButton(
              color: Colors.blue,
              child: Text('reload'),
              // onPressed: _load(1, 1, ""),
            );
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
            return _buildListProduct(currentState.productResponse);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load(int catId, int pageNumber, String name) {
    widget._productBloc.add(LoadProductEvent(catId, pageNumber, name));
  }
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
          // onTap: () => {_openMyPage(proRes.products[index])},
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
        );
      },
      itemCount: proRes.products.length);
}
