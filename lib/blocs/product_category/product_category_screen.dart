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
      int pageNumber,
      int companyId})
      : _productCategoryBloc = productCategoryBloc,
        pageNumber = pageNumber,
        companyId = companyId,
        super(key: key);

  final ProductCategoryBloc _productCategoryBloc;
  final int pageNumber;
  final int companyId;
  @override
  ProductCategoryScreenState createState() {
    return ProductCategoryScreenState(this.pageNumber, this.companyId);
  }
}

class ProductCategoryScreenState extends State<ProductCategoryScreen> {
  int pageNumber;
  int companyId;
  ProductCategoryScreenState(this.pageNumber, this.companyId);
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
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
    _load(this.pageNumber);
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
                    onPressed: () => {_load(this.pageNumber)},
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
              onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductPage(catRes.productcats[index].id, 1)),
                    )
                  });
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
        itemCount: catRes.productcats.length);
  }

  void _load(int pageNumber) {
    widget._productCategoryBloc.add(LoadProductCategoryEvent(pageNumber));
  }
}
