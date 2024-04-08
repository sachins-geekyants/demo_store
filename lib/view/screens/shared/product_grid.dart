import 'package:flutter/material.dart';
import 'package:zinc_flutter_assignment/model/product.dart';
import 'package:zinc_flutter_assignment/view/screens/shared/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, i) {
              return ProductCard(product: products[i]);
            },
          ),
        ),
      ],
    );
  }
}
