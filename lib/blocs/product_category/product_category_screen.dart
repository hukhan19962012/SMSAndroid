import 'package:SMSAndroid/constains.dart';
import 'package:SMSAndroid/models/product_category.dart';
import 'package:SMSAndroid/models/product_category_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/product_category/index.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({
    Key key,
    @required ProductCategoryBloc productCategoryBloc,
  })  : _productCategoryBloc = productCategoryBloc,
        super(key: key);

  final ProductCategoryBloc _productCategoryBloc;

  @override
  ProductCategoryScreenState createState() {
    return ProductCategoryScreenState();
  }
}

class ProductCategoryScreenState extends State<ProductCategoryScreen> {
  ProductCategoryScreenState();

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
    return BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
        cubit: widget._productCategoryBloc,
        builder: (
          BuildContext context,
          ProductCategoryState currentState,
        ) {
          if (currentState is UnProductCategoryState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorProductCategoryState) {
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
          if (currentState is InProductCategoryState) {
            return _buildListProductCategory(currentState.cats);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildListProductCategory(ProductCategoryResponse catRes) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(catRes.productcats[index].img),
              radius: 30,
            ),
            title: Text(
              catRes.productcats[index].name,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            subtitle: Text(
              catRes.productcats[index].description,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            // onTap: () => {_return null;}
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
        itemCount: catRes.productcats.length);
  }

  void _load() {
    widget._productCategoryBloc.add(LoadProductCategoryEvent());
  }
}
