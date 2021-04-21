part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class CheckoutCartEvent extends CheckoutEvent {
  final List<CartItem> items;
  final double subTotal;
  final double total;
  final double serviceFee;
  final Collector collector;
  final CollectionPoint collectionPoint;

  CheckoutCartEvent({
    @required this.collectionPoint,
    @required this.collector,
    @required this.items,
    @required this.serviceFee,
    @required this.subTotal,
    @required this.total,
  });

  @override
  List<Object> get props => [collectionPoint, collector, items, serviceFee, subTotal, total];
}
