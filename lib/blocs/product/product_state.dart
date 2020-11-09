import 'package:SMSAndroid/models/product_response.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  /// notify change state without deep clone state
  final int version;
  final int catId;
  final String name;
  final int pageNumber;
  final List propss;
  ProductState(this.version, this.catId, this.name, this.pageNumber,
      [this.propss]);

  /// Copy object for use in action
  /// if need use deep clone
  ProductState getStateCopy();

  ProductState getNewVersion();=

  @override
  List<Object> get props => ([version, ...propss ?? []]);
}

/// UnInitialized
class UnProductState extends ProductState {
  UnProductState(int version) : super(version);

  @override
  String toString() => 'UnProductState';

  @override
  UnProductState getStateCopy() {
    return UnProductState(0);
  }

  @override
  UnProductState getNewVersion() {
    return UnProductState(version + 1);
  }
}

/// Initialized
class InProductState extends ProductState {
  final ProductResponse productResponse;

  InProductState(int version, this.productResponse)
      : super(version, [productResponse]);

  @override
  String toString() => 'InProductState';

  @override
  InProductState getStateCopy() {
    return InProductState(version, productResponse);
  }

  @override
  InProductState getNewVersion() {
    return InProductState(version + 1, productResponse);
  }
}

class ErrorProductState extends ProductState {
  final String errorMessage;

  ErrorProductState(int version, this.errorMessage)
      : super(version, [errorMessage]);

  @override
  String toString() => 'ErrorProductState';

  @override
  ErrorProductState getStateCopy() {
    return ErrorProductState(version, errorMessage);
  }

  @override
  ErrorProductState getNewVersion() {
    return ErrorProductState(version + 1, errorMessage);
  }
}
