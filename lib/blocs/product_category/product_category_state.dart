import 'package:equatable/equatable.dart';

abstract class ProductCategoryState extends Equatable {

  final List propss;
  ProductCategoryState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnProductCategoryState extends ProductCategoryState {

  UnProductCategoryState();

  @override
  String toString() => 'UnProductCategoryState';
}

/// Initialized
class InProductCategoryState extends ProductCategoryState {
  final String hello;

  InProductCategoryState(this.hello) : super([hello]);

  @override
  String toString() => 'InProductCategoryState $hello';

}

class ErrorProductCategoryState extends ProductCategoryState {
  final String errorMessage;

  ErrorProductCategoryState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorProductCategoryState';
}
