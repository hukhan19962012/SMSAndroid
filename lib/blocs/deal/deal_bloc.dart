import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:SMSAndroid/blocs/deal/index.dart';

class DealBloc extends Bloc<DealEvent, DealState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final DealBloc _dealBlocSingleton = DealBloc._internal();
  factory DealBloc() {
    return _dealBlocSingleton;
  }
  DealBloc._internal(): super(UnDealState(0));
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  DealState get initialState => UnDealState(0);

  @override
  Stream<DealState> mapEventToState(
    DealEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'DealBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
