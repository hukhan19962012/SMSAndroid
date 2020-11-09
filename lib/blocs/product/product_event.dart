import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/product/index.dart';
import 'package:SMSAndroid/repository/product_repository.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent {
  Stream<ProductState> applyAsync(
      {ProductState currentState, ProductBloc bloc});
  final ProductRepository _productRepository = ProductRepository();
}

class UnProductEvent extends ProductEvent {
  @override
  Stream<ProductState> applyAsync(
      {ProductState currentState, ProductBloc bloc}) async* {
    yield UnProductState(0);
  }
}

class LoadProductEvent extends ProductEvent {
  final int catId;
  final String name;
  final int pageNumber;
  @override
  String toString() => 'LoadProductEvent';

  LoadProductEvent(this.catId, this.pageNumber, this.name);

  @override
  Stream<ProductState> applyAsync(
      {ProductState currentState, ProductBloc bloc}) async* {
    try {
      yield UnProductState(0);
      await Future.delayed(Duration(seconds: 1));

      yield InProductState(
        0,
      );
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductState(0, _?.toString());
    }
  }
}
