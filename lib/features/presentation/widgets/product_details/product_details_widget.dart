import 'package:flutter/material.dart';

import '../../../domain/entities/product.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: 248,
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
                            product.packageName,
                            style: const TextStyle(
                              fontSize: 14,
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
                    height: 14,
                  ),
                  Text(
                    "${product.package} GB",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
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
                  Text(
                    (product.price != 0) ? "Rp${product.price}" : "FREE",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEC2028),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFFF1F2F6),
              height: 8,
            )
          ],
        ),
        // BUY BUTTON
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: const Color(0xFFF1F2F6),
              height: 8,
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC2028)),
                  child: const Text(
                    "BELI SEKARANG",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
