import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  InputField({
    required this.hintText,
    required this.width,
    required this.obscureText,
    this.controller,
    required this.bgcolor,
    this.onChanged,
    this.padding,
    this.keyboardType,
    this.textStyle,
    this.hintStyle,
    super.key,
  });

  Color bgcolor;
  final EdgeInsets? padding;
  final double width;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: widget.bgcolor,
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: widget.width / 100,
        ),
      ),
      width: widget.width,
      child: TextField(
        onChanged: (String value) {
          if (widget.bgcolor != Colors.white) {
            setState(() {
              widget.bgcolor = Colors.white;
            });
          }
          widget.onChanged?.call(value);
        },
        controller: widget.controller,
        obscureText: widget.obscureText,
        autocorrect: !widget.obscureText,
        enableSuggestions: !widget.obscureText,
        keyboardType: widget.keyboardType,

        // Apply the input text style
        style: widget.textStyle ??
            const TextStyle(color: Colors.black, fontSize: 16),

        decoration: InputDecoration(
          hintText: widget.hintText,
          // Apply the hint text style
          hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
