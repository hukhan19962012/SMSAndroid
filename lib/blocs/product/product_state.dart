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
  final String hello;

  InProductState(this.hello) : super([hello]);

  @override
  String toString() => 'InProductState $hello';

}

class ErrorProductState extends ProductState {
  final String errorMessage;

  ErrorProductState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorProductState';
}
