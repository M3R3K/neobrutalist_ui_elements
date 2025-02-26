import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  InputField({
    required this.hintText,
    required this.width,
    required this.obscureText,
    this.controller,
    required this.bgcolor,
    this.onChanged,
    this.padding,
    super.key,
  });

  Color bgcolor;
  final EdgeInsets? padding;
  final double width;
  final String hintText;
  TextEditingController? controller;
  final bool obscureText;
  Function? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: widget.width / 100),
        boxShadow: [
          BoxShadow(
            color: widget.bgcolor,
          ),
        ],
      ),
      width: widget.width,
      child: TextField(
        onChanged: (String value) {
          setState(() {
            widget.bgcolor = Colors.white;
          });
        },
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            hintText: widget.hintText, border: InputBorder.none),
      ),
    );
  }
}
