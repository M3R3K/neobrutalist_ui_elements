import 'package:flutter/material.dart';

/// A neobrutalist text container widget with hard shadow effect.
///
/// This widget creates a container for text with:
/// - Hard black shadow offset (4, 4)
/// - Bold black border
/// - Customizable background color
/// - Smooth color transitions
///
/// Example:
/// ```dart
/// NeoTextContainer(
///   textWidget: const Text(
///     'Shadowy Text Container',
///     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
///   ),
///   width: 250,
///   bgcolor: const Color(0xFF3AC1FF),
/// )
/// ```
class NeoTextContainer extends StatefulWidget {
  /// Creates a neobrutalist text container.
  ///
  /// The [textWidget], [width], and [bgcolor] parameters are required.
  const NeoTextContainer({
    required this.textWidget,
    required this.width,
    required this.bgcolor,
    super.key,
  });

  /// The text widget to display inside the container.
  final Widget textWidget;

  /// The width of the container.
  final double width;

  /// The background color of the container.
  final Color bgcolor;

  @override
  State<NeoTextContainer> createState() => _NeoTextContainerState();
}

class _NeoTextContainerState extends State<NeoTextContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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
