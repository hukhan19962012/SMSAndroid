import 'package:SMSAndroid/models/product_response.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  /// notify change state without deep clone state
  final List propss;
  ProductState([this.propss]);

  /// Copy object for use in action
  /// if need use deep clone

  @override
  List<Object> get props => ([...propss ?? []]);
}

/// UnInitialized
class UnProductState extends ProductState {
  final int catId;
  final String name;
  final int pageNum;
  UnProductState(this.catId, this.name, this.pageNum) : super();

  @override
  String toString() => 'UnProductState';
}

/// Initialized
class InProductState extends ProductState {
  final ProductResponse productResponse;

  InProductState(this.productResponse) : super([productResponse]);

  @override
  String toString() => 'InProductState';
}

class ErrorProductState extends ProductState {
  final String errorMessage;

  ErrorProductState(this.errorMessage) : super();

  @override
  String toString() => 'ErrorProductState';

  Future<ErrorProductState> getStateCopy() async {
    return ErrorProductState(errorMessage);
  }

  @override
  ErrorProductState getNewVersion() {
    return ErrorProductState(errorMessage);
  }
}
