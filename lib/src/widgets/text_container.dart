import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    required this.text,
    required this.width,
    required this.bgcolor,
    super.key,
  });
  final String text;
  final double width;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: bgcolor, // Light green background
        border: Border.all(color: Colors.black, width: 2), // Black border
        boxShadow: const [
          BoxShadow(
            color: Colors.black, // Shadow color
            offset: Offset(4, 4), // Shadow offset
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
