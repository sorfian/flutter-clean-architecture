import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/category-details");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 53,
            height: 53,
            decoration: BoxDecoration(
              color: const Color(0xFFF7B731).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
              // fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
