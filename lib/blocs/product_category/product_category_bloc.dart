import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:SMSAndroid/blocs/product_category/index.dart';

class ProductCategoryBloc extends Bloc<ProductCategoryEvent, ProductCategoryState> {

  ProductCategoryBloc(ProductCategoryState initialState) : super(initialState);

  @override
  Stream<ProductCategoryState> mapEventToState(
    ProductCategoryEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ProductCategoryBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
