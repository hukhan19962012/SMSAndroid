import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/deal/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DealEvent {
  Stream<DealState> applyAsync({DealState currentState, DealBloc bloc});
  final DealRepository _dealRepository = DealRepository();
  }
  
 
class UnDealEvent extends DealEvent {
  @override
  Stream<DealState> applyAsync({DealState currentState, DealBloc bloc}) async* {
    yield UnDealState(0);
  }
}

class LoadDealEvent extends DealEvent {
  final bool isError;
  @override
  String toString() => 'LoadDealEvent';

  LoadDealEvent(this.isError);

  @override
  Stream<DealState> applyAsync({DealState currentState, DealBloc bloc}) async* {
    try {
      yield UnDealState(0);
      await Future.delayed(Duration(seconds: 1));
      // _dealRepository.test(isError);
      yield InDealState(0, 'Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadDealEvent', error: _, stackTrace: stackTrace);
      yield ErrorDealState(0, _?.toString());
    }
  }
}
