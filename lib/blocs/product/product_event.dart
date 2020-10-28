import 'dart:async';
import 'dart:developer' as developer;

import 'package:SMSAndroid/blocs/product/index.dart';
import 'package:SMSAndroid/models/product_response.dart';
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
    print("debug2");
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
      print("debug1");
      ProductResponse listProduct = await _productRepository.getProducts();
      print(listProduct.products.toString());
      yield InProductState(listProduct);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductState(_?.toString());
    }
  }
}
