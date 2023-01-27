import 'package:flutter/material.dart';

class CustomCardCategoryDetails extends StatelessWidget {
  const CustomCardCategoryDetails({
    Key? key,
    required this.package,
    required this.expired,
    this.price,
    this.discount,
    required this.packageName,
  }) : super(key: key);

  final int package;
  final int expired;
  final int? price;
  final int? discount;
  final String packageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Card(
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
                  Text(
                    "$package GB",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                          "$expired HARI",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
              (discount != null)
                  ? Text(
                      "Rp$discount",
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
                    (price != null) ? "Rp$price" : "FREE",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEC2028),
                    ),
                  ),
                  Text(
                    packageName,
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
