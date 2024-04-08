import 'dart:convert';

import 'package:zinc_flutter_assignment/model/product.dart';
import 'package:zinc_flutter_assignment/repository/store_repository.dart';
import 'package:http/http.dart' as http;

class StoreRepositoryImpl implements StoreRepository {
  final apiEndpoint;
  StoreRepositoryImpl({required this.apiEndpoint});

  @override
  Future<List<Product>?> getProducts() async {
    try {
      var res = await http.get(Uri.parse('${apiEndpoint}products'));
      if (res.statusCode == 200) {
        var jsonProducts = jsonDecode(res.body) as List;
        List<Product> allProducts =
            jsonProducts.map((e) => Product.fromJson(e)).toList();
        return allProducts;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
