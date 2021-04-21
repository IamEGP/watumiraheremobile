import 'package:meta/meta.dart';
import 'package:watumira/data/models/orders.dart';
import 'package:watumira/data/repositories/checkout/checkout_provider.dart';

class CheckoutRepository {
  final CheckoutProvider provider;

  CheckoutRepository({@required this.provider});

  Future<String> getCartId({
    @required dynamic items,
    @required double subTotal,
    @required double serviceFee,
    @required double total,
  }) async {
    String id = await provider.processCart(items: items, subTotal: subTotal, serviceFee: serviceFee, total: total);
    return id;
  }

  Future<Order> processOrder({@required String cartId, @required String collector, @required String collectionPoint}) async {
    var data = await provider.placeOrder(cartId: cartId, collectorId: collector, collectionPointId: collectionPoint);
    return Order.fromJson(data);
  }
}
