import 'package:flutter/material.dart';

/// A neobrutalist container widget with customizable animations, shadow effects, and press interactions.
///
/// This widget creates a container with a distinctive neobrutalist design featuring:
/// - Hard black shadow offset
/// - Bold black border
/// - Smooth press animations
/// - Customizable colors and border radius
///
/// Example:
/// ```dart
/// NeoContainer(
///   offset: 3,
///   animate: true,
///   padding: const EdgeInsets.all(16),
///   bgcolor: const Color(0xFFFFD93D),
///   borderRadius: 8,
///   onPressed: () {
///     print('Container pressed');
///   },
///   child: const Text('Neo Container'),
/// )
/// ```
class NeoContainer extends StatefulWidget {
  /// Creates a neobrutalist container.
  ///
  /// The [bgcolor], [animate], [child], [borderRadius], and [offset] parameters are required.
  const NeoContainer({
    super.key,
    required this.bgcolor,
    required this.animate,
    required this.child,
    required this.borderRadius,
    required this.offset,
    this.padding,
    this.onPressed,
  });

  /// The background color of the container.
  final Color bgcolor;

  /// The child widget to display inside the container.
  final Widget child;

  /// The border radius for the container corners.
  final double borderRadius;

  /// Callback function called when the container is pressed.
  ///
  /// Only works if [animate] is true.
  final Function? onPressed;

  /// Whether to enable press animations and interactions.
  ///
  /// When true, the container will animate on press and call [onPressed] when tapped.
  final bool animate;

  /// The padding inside the container.
  ///
  /// If null, defaults to EdgeInsets.all(0).
  final EdgeInsets? padding;

  /// The offset distance for the shadow effect.
  ///
  /// This determines how much the container "pops out" from its shadow.
  /// Higher values create a more pronounced 3D effect.
  final double offset;

  @override
  State<NeoContainer> createState() => _NeoContainerState();
}

class _NeoContainerState extends State<NeoContainer> {
  bool _isPressed = false;

  void _handleTap() {
    if (!widget.animate) return;

    setState(() => _isPressed = true);

    // Execute callback
    widget.onPressed?.call();

    // Reset after a short delay to simulate a click
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() => _isPressed = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // The trick: The black "shadow" stays in place,
    // and the colored container slides over it.
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: (_) =>
          widget.animate ? setState(() => _isPressed = true) : null,
      onTapUp: (_) =>
          widget.animate ? setState(() => _isPressed = false) : null,
      onTapCancel: () =>
          widget.animate ? setState(() => _isPressed = false) : null,
      child: Container(
        // This is the background/shadow that defines the FIXED SIZE
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 60),
          curve: Curves.easeInOut,
          // Move the child instead of resizing it
          transform: Matrix4.translationValues(
            _isPressed ? 0 : -widget.offset,
            _isPressed ? 0 : -widget.offset,
            0,
          ),
          padding: widget.padding ?? const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: widget.bgcolor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
