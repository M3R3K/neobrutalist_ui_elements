import 'package:flutter/material.dart';

/// A neobrutalist loading indicator widget with rotating arc animation.
///
/// This widget creates a loading indicator with:
/// - Hard black shadow effect
/// - Bold black border
/// - Rotating arc animation (120-degree sweep)
/// - Customizable size, color, and animation speed
///
/// Example:
/// ```dart
/// NeoLoadingIndicator(
///   size: 48.0,
///   color: const Color(0xFF4CAF50),
///   strokeWidth: 4.0,
///   shadowOffset: 2.0,
///   duration: const Duration(milliseconds: 700),
/// )
/// ```
class NeoLoadingIndicator extends StatefulWidget {
  /// Creates a neobrutalist loading indicator.
  const NeoLoadingIndicator({
    super.key,
    this.size = 48.0,
    this.color = const Color(0xFF4CAF50),
    this.strokeWidth = 4.0,
    this.shadowOffset = 2.0,
    this.borderRadius,
    this.duration = const Duration(milliseconds: 700),
  });

  /// The size (width and height) of the loading indicator.
  ///
  /// Defaults to 48.0.
  final double size;

  /// The background color of the loading indicator container.
  ///
  /// Defaults to Color(0xFF4CAF50) (green).
  final Color color;

  /// The width of the rotating arc stroke.
  ///
  /// Defaults to 4.0.
  final double strokeWidth;

  /// The offset distance for the shadow effect.
  ///
  /// This determines how much the indicator "pops out" from its shadow.
  /// Defaults to 2.0.
  final double shadowOffset;

  /// Optional border radius for the indicator container.
  ///
  /// If null, defaults to circular (size / 2).
  final double? borderRadius;

  /// The duration for one complete rotation of the arc.
  ///
  /// Defaults to 700 milliseconds.
  final Duration duration;

  @override
  State<NeoLoadingIndicator> createState() => _NeoLoadingIndicatorState();
}

class _NeoLoadingIndicatorState extends State<NeoLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _createController();
  }

  void _createController() {
    if (!_isDisposed) {
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration,
      )..repeat();
    }
  }

  @override
  void didUpdateWidget(NeoLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration && mounted && !_isDisposed) {
      // Use post-frame callback to safely update during hot reload
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_isDisposed) {
          try {
            final wasAnimating = _controller.isAnimating;
            _controller.stop();
            _controller.duration = widget.duration;
            _controller.reset();
            if (wasAnimating) {
              _controller.repeat();
            }
          } catch (e) {
            // If update fails, ignore - the controller will continue with old duration
            // This prevents crashes during hot reload
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? widget.size / 2;
    final borderWidth = 2.0;

    return SizedBox(
      width: widget.size + widget.shadowOffset,
      height: widget.size + widget.shadowOffset,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shadow layer (black background) - positioned at bottom-right
          Positioned(
            left: widget.shadowOffset,
            top: widget.shadowOffset,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          // Main container with border - positioned at top-left
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: Colors.black,
                  width: borderWidth,
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: widget.size * 0.6,
                  height: widget.size * 0.6,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _controller.value * 2 * 3.14159,
                        child: CustomPaint(
                          painter: _NeoLoadingPainter(
                            color: Colors.black,
                            strokeWidth: widget.strokeWidth,
                          ),
                          size: Size(widget.size * 0.6, widget.size * 0.6),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NeoLoadingPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _NeoLoadingPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    // Draw an arc that rotates
    const startAngle = -1.5708; // Start at top (-90 degrees)
    const sweepAngle =
        2.0944; // 120 degrees (3/4 of circle for neobrutalist look)

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_NeoLoadingPainter oldDelegate) {
    // Always repaint to ensure smooth animation
    return true;
  }
}
