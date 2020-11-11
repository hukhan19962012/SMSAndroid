import 'package:flutter/material.dart';
import 'package:SMSAndroid/blocs/company/index.dart';

class CompanyPage extends StatefulWidget {
  static const String routeName = '/company';

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final _companyBloc = CompanyBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company'),
      ),
      body: CompanyScreen(companyBloc: _companyBloc),
    );
  }
}
