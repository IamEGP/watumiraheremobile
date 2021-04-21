import 'package:meta/meta.dart';
import 'package:watumira/data/models/products.dart';
import 'package:watumira/data/repositories/products/products_provider.dart';

class ProductsRepository {
  final ProductsProvider provider;
  ProductsRepository({@required this.provider});
  Future<Products> getProducts({String town, String type, int page, int limit, String query}) async {
    var data = await provider.getProducts(
      town: town,
      type: type,
      page: page,
      limit: limit,
      query: query,
    );
    return Products.fromJson(data);
  }

  Future<Product> getProduct(String slug) async {
    var data = await provider.getProduct(slug);
    return Product.fromJson(data);
  }
}
