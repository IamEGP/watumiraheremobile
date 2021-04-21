import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watumira/data/models/products.dart';

part 'quantity_event.dart';
part 'quantity_state.dart';

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  QuantityBloc() : super(QuantityInitial());

  @override
  Stream<QuantityState> mapEventToState(
    QuantityEvent event,
  ) async* {
    if (event is AddProductToQuantityEvent) {
      yield ProductQuantityState(product: event.product, quantity: 1);
    }

    if (event is AddQuantityEvent) {
      var currentState = state;
      if (currentState is ProductQuantityState) {
        yield currentState.copyWith(quantity: currentState.quantity + 1);
      }
    }

    if (event is SubtractQuantityEvent) {
      var currentState = state;
      if (currentState is ProductQuantityState) {
        if (currentState.quantity > 1) {
          yield currentState.copyWith(quantity: currentState.quantity - 1);
        }
      }
    }
  }
}
