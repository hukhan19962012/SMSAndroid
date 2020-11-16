import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/deal/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DealEvent {
  Stream<DealState> applyAsync({DealState currentState, DealBloc bloc});
}

class UnDealEvent extends DealEvent {
  @override
  Stream<DealState> applyAsync({DealState currentState, DealBloc bloc}) async* {
    yield UnDealState();
  }
}

class LoadDealEvent extends DealEvent {
  @override
  Stream<DealState> applyAsync({DealState currentState, DealBloc bloc}) async* {
    try {
      yield UnDealState();
      await Future.delayed(Duration(seconds: 1));
      yield InDealState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadDealEvent', error: _, stackTrace: stackTrace);
      yield ErrorDealState(_?.toString());
    }
  }
}
