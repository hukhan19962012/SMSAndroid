import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SMSAndroid/blocs/deal/index.dart';

class DealScreen extends StatefulWidget {
  const DealScreen({
    Key key,
    @required DealBloc dealBloc,
  })  : _dealBloc = dealBloc,
        super(key: key);

  final DealBloc _dealBloc;

  @override
  DealScreenState createState() {
    return DealScreenState();
  }
}

class DealScreenState extends State<DealScreen> {
  DealScreenState();

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
    return BlocBuilder<DealBloc, DealState>(
        cubit: widget._dealBloc,
        builder: (
          BuildContext context,
          DealState currentState,
        ) {
          if (currentState is UnDealState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorDealState) {
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
           if (currentState is InDealState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    widget._dealBloc.add(LoadDealEvent());
  }
}
