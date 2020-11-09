import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:SMSAndroid/blocs/product/index.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final ProductBloc _productBlocSingleton = ProductBloc._internal();
  factory ProductBloc() {
    return _productBlocSingleton;
  }
  ProductBloc._internal() : super(UnProductState(1, "", 1));

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  ProductState get initialState => UnProductState(1, "", 1);

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
