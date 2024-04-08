import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zinc_flutter_assignment/model/product.dart';
import 'package:zinc_flutter_assignment/repository/store_repository_impl.dart';

class StoreProvider extends ChangeNotifier {
  List<Product>? products;
  String? errorMessage;

  getProdcts() async {
    /// data already cached
    if (products != null) {
      notifyListeners();
      return;
    }

    try {
      products = await GetIt.I<StoreRepositoryImpl>().getProducts();
    } catch (e) {
      products = null;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
