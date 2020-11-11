import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/company/index.dart';
import 'package:SMSAndroid/repository/company_repository.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CompanyEvent {
  Stream<CompanyState> applyAsync(
      {CompanyState currentState, CompanyBloc bloc});
  final CompanyRepository _companyRepository = CompanyRepository();
}

class UnCompanyEvent extends CompanyEvent {
  @override
  Stream<CompanyState> applyAsync(
      {CompanyState currentState, CompanyBloc bloc}) async* {
    yield UnCompanyState(0);
  }
}

class LoadCompanyEvent extends CompanyEvent {
  final bool isError;
  @override
  String toString() => 'LoadCompanyEvent';

  LoadCompanyEvent(this.isError);

  @override
  Stream<CompanyState> applyAsync(
      {CompanyState currentState, CompanyBloc bloc}) async* {
    try {
      yield UnCompanyState(0);
      await Future.delayed(Duration(seconds: 1));
      //do shit here

      yield InCompanyState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadCompanyEvent', error: _, stackTrace: stackTrace);
      yield ErrorCompanyState(0, _?.toString());
    }
  }
}
