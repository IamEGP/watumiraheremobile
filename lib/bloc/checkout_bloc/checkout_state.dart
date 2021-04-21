part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutProcessing extends CheckoutState {}

class CheckoutProcessSuccessfull extends CheckoutState {
  final orderObj.Order order;
  CheckoutProcessSuccessfull({@required this.order});
  @override
  List<Object> get props => [order];
}

class CheckoutProcessFailed extends CheckoutState {
  final String message;
  CheckoutProcessFailed({@required this.message});

  @override
  List<Object> get props => [message];
}
