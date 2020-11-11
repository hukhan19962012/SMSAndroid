import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:SMSAndroid/blocs/company/index.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final CompanyBloc _companyBlocSingleton = CompanyBloc._internal();
  factory CompanyBloc() {
    return _companyBlocSingleton;
  }
  CompanyBloc._internal(): super(UnCompanyState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  CompanyState get initialState => UnCompanyState(0);

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
