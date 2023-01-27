import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.image,
    required this.height,
    required this.width,
    this.cardHeight,
  }) : super(key: key);

  final String title;
  final String image;
  final double height;
  final double width;
  final double? cardHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: width,
      margin: const EdgeInsets.only(left: 2, top: 2, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Color.fromARGB(12, 129, 129, 129),
            offset: Offset(4.0, 4.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
