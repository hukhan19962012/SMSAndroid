import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:SMSAndroid/blocs/Company/index.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {

  CompanyBloc(CompanyState initialState) : super(initialState);

  @override
  Stream<CompanyState> mapEventToState(
    CompanyEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'CompanyBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
