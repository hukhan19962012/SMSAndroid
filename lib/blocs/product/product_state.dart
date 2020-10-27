import 'package:SMSAndroid/models/product.dart';
import 'package:SMSAndroid/models/product_response.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  final List propss;
  ProductState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnProductState extends ProductState {
  UnProductState();

  @override
  String toString() => 'UnProductState';
}

/// Initialized
class InProductState extends ProductState {
  final ProductResponse productResponse;

  InProductState(this.productResponse) : super([productResponse]);

  @override
  String toString() => 'InProductState ';
}

class ErrorProductState extends ProductState {
  final String errorMessage;

  ErrorProductState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorProductState';
}
