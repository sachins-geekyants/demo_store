import 'package:zinc_flutter_assignment/model/product.dart';

abstract class StoreRepository {
  Future<List<Product>?> getProducts();
}
