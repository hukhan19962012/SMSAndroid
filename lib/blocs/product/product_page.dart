import 'package:SMSAndroid/blocs/product_category/product_category_page.dart';
import 'package:SMSAndroid/pages/product_page.dart';
import 'package:SMSAndroid/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

import '../../main.dart';

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
    int bottomBarIndex = 1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Product'),
        ),
        body: ProductScreen(
          productBloc: _productBloc,
          catId: catId,
          pageNum: pageNumber,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: bottomBarIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              label: "Công tơ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: "Hoá đơn",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined),
              label: "Khác",
            ),
          ],
          // press for switch tab
          onTap: (index) {
            setState(() {
              bottomBarIndex = index;
              if (index == 0) {
                runApp(ProductMainPage());
              } else if (index == 1) {
                runApp(App());
              } else if (index == 2) {
                runApp(App());
              } else if (index == 3) {
                runApp(App());
              }
            });
          },
        ));
  }
}
