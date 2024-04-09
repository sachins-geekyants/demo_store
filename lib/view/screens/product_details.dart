import 'package:flutter/material.dart';
import 'package:zinc_flutter_assignment/model/product.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.product.image != null
                    ? Image.network(
                        widget.product.image!,
                        height: 300,
                        errorBuilder: (context, url, error) =>
                            const Icon(Icons.image),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 50),
                Text(
                  widget.product.title ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color(0xff21251F),
                  ),
                ),
                Text(
                  widget.product.description ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff686868),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.product.price != null
                        ? SizedBox(
                            width: 100,
                            child: Text(
                              '₹${widget.product.price.toString()}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xff686868),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.product.rating?['rate'] != null
                        ? Row(
                            children: [
                              SizedBox(
                                child: Text(
                                  '${widget.product.rating?['rate']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
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
                const SizedBox(height: 10),
                InkWell(
                  child: Container(
                    width: 100,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black.withOpacity(0.5), width: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'Add',
                        style:
                            TextStyle(color: Color(0xff18A0FB), fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
