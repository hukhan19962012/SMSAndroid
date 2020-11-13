import 'package:SMSAndroid/models/product.dart';
import 'package:SMSAndroid/models/product_response.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  /// notify change state without deep clone state
  final List propss;
  final ProductResponse productResponse;
  final Product product;
  ProductState(this.productResponse, this.product, [this.propss]);

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
  UnProductState(this.catId, this.name, this.pageNum) : super(null, null);

  @override
  String toString() => 'UnProductState';
}

/// Initialized
class InProductState extends ProductState {
  final ProductResponse productResponse;
  final Product product;

  InProductState(this.productResponse, this.product)
      : super(productResponse, product, [productResponse, product]);

  @override
  String toString() => 'InProductState';
}

class ErrorProductState extends ProductState {
  final String errorMessage;

  ErrorProductState(this.errorMessage) : super(null, null);

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
