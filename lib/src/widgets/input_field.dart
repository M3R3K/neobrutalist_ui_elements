import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  InputField({
    required this.hintText,
    required this.obscureText,
    this.controller,
    required this.bgcolor,
    this.onChanged,
    super.key,
  });

  Color bgcolor;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Function? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),

      // color: Colors.white,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
        boxShadow: [
          BoxShadow(
            color: widget.bgcolor,
          ),
        ],
      ),
      width: 250,
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
