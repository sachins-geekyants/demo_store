import 'package:flutter/material.dart';
import 'package:zinc_flutter_assignment/environment/store_environment.dart';
import 'package:zinc_flutter_assignment/model/product.dart';
import 'package:zinc_flutter_assignment/repository/store_repository_impl.dart';

class StoreProvider extends ChangeNotifier {
  List<Product>? products;

  getProdcts() async {
    /// data already cached
    if (products != null) {
      notifyListeners();
      return;
    }
    // TODO: use get Itinstead
    StoreRepositoryImpl storeRepositoryImpl =
        StoreRepositoryImpl(apiEndpoint: StoreEnv.api);

    products = await storeRepositoryImpl.getProducts();
    notifyListeners();
  }
}
