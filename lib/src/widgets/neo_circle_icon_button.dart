import 'package:flutter/material.dart';

class NeoCircleIconButton extends StatefulWidget {
  const NeoCircleIconButton({
    super.key,
    this.splashColor,
    this.highlightColor,
    required this.padding,
    required this.icon,
    required this.backgroundColor,
    required this.offset, // Simplified to one offset value for diagonal movement
    required this.onPressed,
  });

  final EdgeInsets padding;
  final double offset; // The distance it pops out
  final Icon icon;
  final Color backgroundColor;
  final Color? splashColor;
  final Color? highlightColor;
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
