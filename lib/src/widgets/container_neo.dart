import 'package:flutter/material.dart';

class ContainerNeo extends StatefulWidget {
  const ContainerNeo({
    super.key,
    required this.bgcolor,
    required this.animate,
    required this.child,
    required this.borderRadius,
    required this.offset, // How much it 'pops' out
    this.padding,
    this.onPressed,
  });

  final Color bgcolor;
  final Widget child;
  final double borderRadius;
  final Function? onPressed;
  final bool animate;
  final EdgeInsets? padding;
  final double offset;

  @override
  State<ContainerNeo> createState() => _ContainerNeoState();
}

class _ContainerNeoState extends State<ContainerNeo> {
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
