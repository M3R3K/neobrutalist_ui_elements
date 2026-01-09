import 'package:flutter/material.dart';

/// A neobrutalist input field widget with customizable styling and controller support.
///
/// This widget creates a text input field with:
/// - Bold black border
/// - Customizable background color
/// - Support for text controllers
/// - Automatic handling of obscure text (passwords)
///
/// Example:
/// ```dart
/// NeoInputField(
///   hintText: 'Enter your email',
///   width: 300,
///   obscureText: false,
///   bgcolor: const Color(0xFFE0E0E0),
///   keyboardType: TextInputType.emailAddress,
///   controller: myController,
///   onChanged: (value) {
///     print('Input changed: $value');
///   },
/// )
/// ```
class NeoInputField extends StatelessWidget {
  /// Creates a neobrutalist input field.
  ///
  /// The [hintText], [width], [obscureText], and [bgcolor] parameters are required.
  const NeoInputField({
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

  /// The background color of the input field.
  final Color bgcolor;

  /// The padding inside the input field.
  ///
  /// If null, defaults to EdgeInsets.all(6).
  final EdgeInsets? padding;

  /// The width of the input field.
  final double width;

  /// The hint text displayed when the field is empty.
  final String hintText;

  /// Optional controller for the text field.
  ///
  /// If provided, allows programmatic control of the text field's value.
  final TextEditingController? controller;

  /// Whether the input text should be obscured (for passwords).
  ///
  /// When true, autocorrect and suggestions are automatically disabled.
  final bool obscureText;

  /// Callback function called when the text value changes.
  ///
  /// Receives the new text value as a parameter.
  final Function(String)? onChanged;

  /// Callback function called when the field is tapped.
  final Function()? onTap;

  /// The keyboard type to display.
  ///
  /// Common values: TextInputType.emailAddress, TextInputType.number, etc.
  final TextInputType? keyboardType;

  /// The text style for the input text.
  ///
  /// If null, defaults to black text with fontSize 16.
  final TextStyle? textStyle;

  /// The text style for the hint text.
  ///
  /// If null, defaults to grey text.
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
