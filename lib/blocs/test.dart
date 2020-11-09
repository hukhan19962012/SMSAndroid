import 'package:SMSAndroid/models/product_response.dart';
import 'package:flutter/material.dart';

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
