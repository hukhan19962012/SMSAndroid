import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/Company/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CompanyEvent {
  Stream<CompanyState> applyAsync(
      {CompanyState currentState, CompanyBloc bloc});
}

class UnCompanyEvent extends CompanyEvent {
  @override
  Stream<CompanyState> applyAsync({CompanyState currentState, CompanyBloc bloc}) async* {
    yield UnCompanyState();
  }
}

class LoadCompanyEvent extends CompanyEvent {
   
  @override
  Stream<CompanyState> applyAsync(
      {CompanyState currentState, CompanyBloc bloc}) async* {
    try {
      yield UnCompanyState();
      await Future.delayed(Duration(seconds: 1));
      yield InCompanyState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadCompanyEvent', error: _, stackTrace: stackTrace);
      yield ErrorCompanyState( _?.toString());
    }
  }
}
