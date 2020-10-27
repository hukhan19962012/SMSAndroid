import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(ProductState initialState) : super(initialState);

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ProductBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
