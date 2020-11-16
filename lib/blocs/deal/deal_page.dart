import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/deal/index.dart';

class DealPage extends StatefulWidget {
  static const String routeName = '/deal';

  @override
  _DealPageState createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  final _dealBloc = DealBloc(UnDealState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deal'),
      ),
      body: DealScreen(dealBloc: _dealBloc),
    );
  }
}
