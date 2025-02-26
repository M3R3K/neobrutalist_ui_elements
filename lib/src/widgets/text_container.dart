import 'package:flutter/material.dart';

class TextContainer extends StatefulWidget {
  const TextContainer({
    required this.textWidget,
    required this.width,
    required this.bgcolor,
    super.key,
  });
  final Widget textWidget;
  final double width;
  final Color bgcolor;

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.bgcolor,
        border: Border.all(color: Colors.black, width: 2), // Black border
        boxShadow: const [
          BoxShadow(
            color: Colors.black, // Shadow color
            offset: Offset(4, 4), // Shadow offset
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: widget.textWidget,
    );
  }
}
