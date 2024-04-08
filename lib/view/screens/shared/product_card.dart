import 'package:flutter/material.dart';
import 'package:zinc_flutter_assignment/model/product.dart';
import 'package:zinc_flutter_assignment/view/screens/product_details.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(product: product)),
        );
      },
      child: Container(
        width: 119,
        height: 140,
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 5, right: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 65,
                child: product.image != null
                    ? Image.network(
                        product.image!,
                        width: 65,
                        errorBuilder: (context, url, error) =>
                            Image.asset('assets/images/organic_category.png'),
                      )
                    : const SizedBox.shrink()),
            const SizedBox(height: 1),
            Text(
              product.title ?? '',
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xff21251F),
              ),
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                product.price != null
                    ? SizedBox(
                        width: 100,
                        child: Text(
                          '₹${product.price.toString()}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff686868),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                product.rating?['rate'] != null
                    ? Row(
                        children: [
                          SizedBox(
                            child: Text(
                              '${product.rating?['rate']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff686868),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          )
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 5),
            Text(
              product.category ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xff686868),
              ),
            )
          ],
        ),
      ),
    );
  }
}
