import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:SMSAndroid/blocs/deal/index.dart';

class DealBloc extends Bloc<DealEvent, DealState> {

  DealBloc(DealState initialState) : super(initialState);

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
