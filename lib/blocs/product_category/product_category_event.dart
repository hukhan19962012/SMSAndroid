import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/product_category/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductCategoryEvent {
  Stream<ProductCategoryState> applyAsync(
      {ProductCategoryState currentState, ProductCategoryBloc bloc});
}

class UnProductCategoryEvent extends ProductCategoryEvent {
  @override
  Stream<ProductCategoryState> applyAsync({ProductCategoryState currentState, ProductCategoryBloc bloc}) async* {
    yield UnProductCategoryState();
  }
}

class LoadProductCategoryEvent extends ProductCategoryEvent {
   
  @override
  Stream<ProductCategoryState> applyAsync(
      {ProductCategoryState currentState, ProductCategoryBloc bloc}) async* {
    try {
      yield UnProductCategoryState();
      await Future.delayed(Duration(seconds: 1));
      yield InProductCategoryState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadProductCategoryEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductCategoryState( _?.toString());
    }
  }
}
