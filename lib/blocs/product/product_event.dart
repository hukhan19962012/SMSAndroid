import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/product/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent {
  Stream<ProductState> applyAsync(
      {ProductState currentState, ProductBloc bloc});
}

class UnProductEvent extends ProductEvent {
  @override
  Stream<ProductState> applyAsync({ProductState currentState, ProductBloc bloc}) async* {
    yield UnProductState();
  }
}

class LoadProductEvent extends ProductEvent {
   
  @override
  Stream<ProductState> applyAsync(
      {ProductState currentState, ProductBloc bloc}) async* {
    try {
      yield UnProductState();
      await Future.delayed(Duration(seconds: 1));
      yield InProductState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadProductEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductState( _?.toString());
    }
  }
}
