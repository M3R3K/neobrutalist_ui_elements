import 'package:flutter/material.dart';

/// A neobrutalist circular icon button with press animations and shadow effects.
///
/// This widget creates a circular button with:
/// - Hard black shadow offset
/// - Bold black border
/// - Smooth press animations
/// - Customizable splash and highlight colors
///
/// Example:
/// ```dart
/// NeoCircleIconButton(
///   padding: const EdgeInsets.all(12),
///   icon: const Icon(Icons.add, size: 40, color: Colors.black),
///   backgroundColor: const Color(0xFF3AC1FF),
///   offset: 4,
///   onPressed: () {
///     print('Button pressed');
///   },
/// )
/// ```
class NeoCircleIconButton extends StatefulWidget {
  /// Creates a neobrutalist circular icon button.
  ///
  /// The [padding], [icon], [backgroundColor], [offset], and [onPressed] parameters are required.
  const NeoCircleIconButton({
    super.key,
    this.splashColor,
    this.highlightColor,
    required this.padding,
    required this.icon,
    required this.backgroundColor,
    required this.offset,
    required this.onPressed,
  });

  /// The padding around the icon.
  final EdgeInsets padding;

  /// The offset distance for the shadow effect.
  ///
  /// This determines how much the button "pops out" from its shadow.
  /// Higher values create a more pronounced 3D effect.
  final double offset;

  /// The icon to display in the button.
  final Icon icon;

  /// The background color of the button.
  final Color backgroundColor;

  /// The splash color when the button is pressed.
  ///
  /// If null, defaults to a semi-transparent black.
  final Color? splashColor;

  /// The highlight color when the button is pressed.
  ///
  /// If null, defaults to a semi-transparent grey.
  final Color? highlightColor;

  /// Callback function called when the button is pressed.
  final Function()? onPressed;

  @override
  State<NeoCircleIconButton> createState() => _NeoCircleIconButtonState();
}

class _NeoCircleIconButtonState extends State<NeoCircleIconButton> {
  bool _isPressed = false;

  void _handleTap() {
    if (widget.onPressed != null) {
      // Small delay to let the user see the animation before triggering action
      setState(() => _isPressed = true);
      widget.onPressed!();
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) setState(() => _isPressed = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: _handleTap,
      child: Container(
        // This is the static black shadow layer
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 70),
          curve: Curves.easeOut,
          // Move the button onto the shadow when pressed
          transform: Matrix4.translationValues(
            _isPressed ? 0 : -widget.offset,
            _isPressed ? 0 : -widget.offset,
            0,
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: widget.icon.size == null ? 2 : widget.icon.size! / 15,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor:
                  widget.splashColor ?? const Color.fromARGB(104, 0, 0, 0),
              highlightColor: widget.highlightColor,
              customBorder: const CircleBorder(),
              onTap:
                  null, // Set to null because GestureDetector handles the tap
              child: Padding(
                padding: widget.padding,
                child: widget.icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
