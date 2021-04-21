import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:watumira/bloc/bloc_functions.dart';
import 'package:watumira/bloc/cart_bloc/cart_bloc.dart';
import 'package:watumira/data/models/cart.dart';
import 'package:watumira/data/models/collectors.dart';
import 'package:watumira/data/models/orders.dart' as orderObj;
import 'package:watumira/data/models/towns.dart';
import 'package:watumira/data/repositories/checkout/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository repository;
  final CartBloc cartBloc;
  CheckoutBloc({@required this.repository, @required this.cartBloc}) : super(CheckoutInitial());

  @override
  Stream<CheckoutState> mapEventToState(
    CheckoutEvent event,
  ) async* {
    if (event is CheckoutCartEvent) {
      try {
        yield CheckoutProcessing();
        var collector = event.collector;
        var town = event.collectionPoint.town;
        var items = [];
        for (CartItem item in event.items) {
          items.add({
            "town": town,
            "product": item.product.id,
            "quantity": item.quantity,
          });
        }
        var cartId = await repository.getCartId(
          items: items,
          subTotal: event.subTotal,
          serviceFee: event.serviceFee,
          total: event.total,
        );
        var order = await repository.processOrder(
          cartId: cartId,
          collector: collector.id,
          collectionPoint: event.collectionPoint.id,
        );
        cartBloc.add(ClearCart());
        yield CheckoutProcessSuccessfull(order: order);
      } catch (e) {
        var message = BlocFunctions.getErrorMessage(e);
        yield CheckoutProcessFailed(message: message);
      }
    }
  }
}
