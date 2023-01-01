import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../pages/product_details/pages.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsPage.routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: Color(0xFFF1F2F6),
          ),
        ),
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 248,
          height: 116,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${product.package} GB",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFFF1F2F6),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/jam_pasir.png",
                              width: 16,
                              height: 16,
                            ),
                            Text(
                              "${product.expired} HARI",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/icons/saved.png",
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              (product.discount != null)
                  ? Text(
                      "Rp${product.discount}",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color(0xFF747D8C),
                          fontSize: 12),
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (product.price != 0) ? "Rp${product.price}" : "FREE",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEC2028),
                    ),
                  ),
                  Text(
                    product.packageName,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
