import 'package:SMSAndroid/models/product_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key key,
    @required ProductBloc productBloc,
    int catId,
    String name,
    int pageNum,
  })  : _productBloc = productBloc,
        catId = catId,
        name = name,
        pageNum = pageNum,
        super(key: key);

  final ProductBloc _productBloc;
  final int catId;
  final String name;
  final int pageNum;
  @override
  ProductScreenState createState() {
    return ProductScreenState(
        this.catId, this.name, this.pageNum, this._productBloc);
  }
}

class ProductScreenState extends State<ProductScreen> {
  ProductScreenState(this.catId, this.name, this.pageNum, this._productBloc);
  int catId;
  String name;
  int pageNum;
  ProductBloc _productBloc;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _load(this.catId, this.pageNum, this.name);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this.pageNum = this.pageNum + 1;
        _load(this.catId, this.pageNum, this.name);
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        if (this.pageNum - 1 > 0) {
          this.pageNum = this.pageNum - 1;
          _load(this.catId, this.pageNum, this.name);
        }
      }
    });
    _loadProduct(1);
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
                onPressed: () => {_load(this.catId, this.pageNum, this.name)});
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
            return _buildListProduct(currentState.productResponse,
                _scrollController, this._productBloc);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load(int catId, int pageNumber, String name) {
    widget._productBloc.add(LoadProductEvent(catId, pageNumber, name));
  }

  void _loadProduct(int proId) {
    widget._productBloc.add(LoadSingleProductEvent(proId));
  }
}

Widget _buildListProduct(ProductResponse proRes, ScrollController controller,
    ProductBloc _productBloc) {
  return ListView.builder(
      controller: controller,
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
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                              productBloc: _productBloc,
                              propid: proRes.products[index].id,
                            )),
                  )
                });
      },
      itemCount: proRes.products.length);
}
