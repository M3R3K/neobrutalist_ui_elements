import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    required this.width,
    required this.obscureText,
    required this.bgcolor,
    this.controller,
    this.onChanged,
    this.padding,
    this.keyboardType,
    this.textStyle,
    this.hintStyle,
    this.onTap,
  });

  final Color bgcolor;
  final EdgeInsets? padding;
  final double width;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(6),
      width: width,
      decoration: BoxDecoration(
        color: bgcolor,
        border: Border.all(
          color: Colors.black,
          width: width / 100,
        ),
      ),
      child: TextField(
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        autocorrect: !obscureText,
        enableSuggestions: !obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: textStyle ?? const TextStyle(color: Colors.black, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
