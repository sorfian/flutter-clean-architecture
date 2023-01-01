import 'package:flutter/material.dart';

class QuotaCard extends StatelessWidget {
  const QuotaCard({
    Key? key,
    required this.title,
    required this.data,
    required this.satuan,
  }) : super(key: key);

  final String title;
  final String data;
  final String satuan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 6,
            color: Color.fromARGB(15, 0, 0, 0),
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          RichText(
            text: TextSpan(
              text: data,
              style: const TextStyle(
                fontSize: 24,
                color: Color(0xFFEC2028),
                fontWeight: FontWeight.bold,
                fontFamily: "ProductSans",
              ),
              children: [
                TextSpan(
                  text: " $satuan",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF747D8C),
                    fontFamily: "ProductSans",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
