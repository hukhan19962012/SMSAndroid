import 'package:SMSAndroid/blocs/product/index.dart';
import 'package:SMSAndroid/models/product_category_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/product_category/index.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen(
      {Key key,
      @required ProductCategoryBloc productCategoryBloc,
      int pageNumber})
      : _productCategoryBloc = productCategoryBloc,
        pageNumber = pageNumber,
        super(key: key);

  final ProductCategoryBloc _productCategoryBloc;
  final int pageNumber;
  @override
  ProductCategoryScreenState createState() {
    return ProductCategoryScreenState(this.pageNumber);
  }
}

class ProductCategoryScreenState extends State<ProductCategoryScreen> {
  int pageNum;

  ProductCategoryScreenState(this.pageNum);
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this.pageNum = this.pageNum + 1;
        _load(this.pageNum);
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        if (this.pageNum - 1 > 0) {
          this.pageNum = this.pageNum - 1;
          _load(
            this.pageNum,
          );
        }
      }
    });
    _load(this.pageNum);
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
                    onPressed: () => {_load(this.pageNum)},
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
    return ListView.builder(
        controller: _scrollController,
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
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductPage(catRes.productcats[index].id, 1)),
                    )
                  });
        },
        itemCount: catRes.productcats.length);
  }

  void _load(int pageNumber) {
    widget._productCategoryBloc.add(LoadProductCategoryEvent(pageNumber));
  }
}
