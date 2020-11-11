import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/company/index.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({
    Key key,
    @required CompanyBloc companyBloc,
  })  : _companyBloc = companyBloc,
        super(key: key);

  final CompanyBloc _companyBloc;

  @override
  CompanyScreenState createState() {
    return CompanyScreenState();
  }
}

class CompanyScreenState extends State<CompanyScreen> {
  CompanyScreenState();

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
    return BlocBuilder<CompanyBloc, CompanyState>(
        cubit: widget._companyBloc,
        builder: (
          BuildContext context,
          CompanyState currentState,
        ) {
          if (currentState is UnCompanyState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorCompanyState) {
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
           if (currentState is InCompanyState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                  Text('Flutter files: done'),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text('throw error'),
                      onPressed: () => _load(true),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load([bool isError = false]) {
    widget._companyBloc.add(LoadCompanyEvent(isError));
  }
}
