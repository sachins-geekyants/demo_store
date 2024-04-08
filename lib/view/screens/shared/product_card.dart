import 'package:flutter/material.dart';
import 'package:zinc_flutter_assignment/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product store;
  const ProductCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                child: store.image != null
                    ? Image.network(
                        store.image!,
                        width: 65,
                        errorBuilder: (context, url, error) =>
                            Image.asset('assets/images/organic_category.png'),
                      )
                    : const SizedBox.shrink()),
            const SizedBox(height: 1),
            Text(
              store.title ?? '',
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
                store.price != null
                    ? SizedBox(
                        width: 100,
                        child: Text(
                          '₹${store.price.toString()}',
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
                store.rating?['rate'] != null
                    ? Row(
                        children: [
                          SizedBox(
                            child: Text(
                              '${store.rating?['rate']}',
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
              store.category ?? '',
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
