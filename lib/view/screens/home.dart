import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zinc_flutter_assignment/provider/store_provider.dart';
import 'package:zinc_flutter_assignment/view/screens/shared/product_card.dart';
import 'package:zinc_flutter_assignment/view/screens/shared/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300]!,
      appBar: AppBar(title: const Text('Zinc Store')),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Consumer<StoreProvider>(
            builder: (context, provider, _) {
              if (provider.products == null) {
                provider.getProdcts();
                return const ShimmerEffect();
              } else if (provider.products != null &&
                  provider.products!.isNotEmpty) {
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: provider.products!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.95,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, i) {
                          return ProductCard(store: provider.products![i]);
                        },
                      ),
                    ),
                  ],
                );
              } else if (provider.products == null &&
                  provider.products!.isEmpty) {
                return const Center(child: Text('No data found'));
              }
              // show error
              return const Center(child: Text('Error in fetching, try again'));
            },
          ),
        ),
      ),
    );
  }
}
