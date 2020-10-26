import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Product")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Colors.blueGrey,
        ),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              "Hello",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text('Productnumber 1'),
          );
        },
        itemCount: 30,
      ),
    );
  }
}
