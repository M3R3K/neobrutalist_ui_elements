import 'package:flutter/material.dart';

/// A neobrutalist slider widget with customizable track colors, thumb size, and shadow effects.
///
/// This widget creates a slider with:
/// - Hard black shadow effect on the thumb
/// - Bold black borders
/// - Customizable track and active track colors
/// - Optional value indicator
/// - Optional divisions for stepped values
///
/// Example:
/// ```dart
/// NeoSlider(
///   value: _sliderValue,
///   onChanged: (value) {
///     setState(() {
///       _sliderValue = value;
///     });
///   },
///   min: 0.0,
///   max: 100.0,
///   trackColor: const Color(0xFFE0E0E0),
///   activeTrackColor: const Color(0xFF4CAF50),
///   thumbColor: Colors.white,
///   height: 24.0,
///   thumbSize: 32.0,
///   shadowOffset: 2.0,
///   showValueIndicator: true,
/// )
/// ```
class NeoSlider extends StatefulWidget {
  /// Creates a neobrutalist slider.
  ///
  /// The [value] and [onChanged] parameters are required.
  const NeoSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 100.0,
    this.trackColor = const Color(0xFFE0E0E0),
    this.activeTrackColor,
    this.thumbColor = Colors.white,
    this.thumbInnerColor,
    this.height = 24.0,
    this.thumbSize = 32.0,
    this.shadowOffset = 2.0,
    this.divisions,
    this.label,
    this.showValueIndicator = true,
  });

  /// The current value of the slider.
  ///
  /// Must be between [min] and [max].
  final double value;

  /// Callback function called when the slider value changes.
  ///
  /// Receives the new value as a parameter.
  final ValueChanged<double> onChanged;

  /// The minimum value of the slider.
  ///
  /// Defaults to 0.0.
  final double min;

  /// The maximum value of the slider.
  ///
  /// Defaults to 100.0.
  final double max;

  /// The color of the inactive track (unfilled portion).
  ///
  /// Defaults to Color(0xFFE0E0E0) (light grey).
  final Color trackColor;

  /// The color of the active track (filled portion).
  ///
  /// If null, defaults to a blend of [trackColor] and green.
  final Color? activeTrackColor;

  /// The color of the slider thumb.
  ///
  /// Defaults to Colors.white.
  final Color thumbColor;

  /// Optional inner color for the thumb (creates a nested circle effect).
  ///
  /// If null, the thumb will be solid [thumbColor].
  final Color? thumbInnerColor;

  /// The height of the track.
  ///
  /// Defaults to 24.0.
  final double height;

  /// The size of the thumb (diameter).
  ///
  /// Defaults to 32.0.
  final double thumbSize;

  /// The offset distance for the thumb shadow effect.
  ///
  /// Defaults to 2.0.
  final double shadowOffset;

  /// The number of divisions (steps) in the slider.
  ///
  /// If null, the slider is continuous.
  /// If provided, the slider will snap to discrete values.
  final int? divisions;

  /// Optional function to generate custom labels for the value indicator.
  ///
  /// Receives the current value and returns a string label.
  final String? Function(double)? label;

  /// Whether to show the value indicator above the thumb.
  ///
  /// Defaults to true.
  final bool showValueIndicator;

  @override
  State<NeoSlider> createState() => _NeoSliderState();
}

class _NeoSliderState extends State<NeoSlider> {
  late double _currentValue;
  bool _isDragging = false;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value.clamp(widget.min, widget.max);
  }

  @override
  void didUpdateWidget(NeoSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _currentValue = widget.value.clamp(widget.min, widget.max);
    }
  }

  void _updateValue(double newValue) {
    final clampedValue = newValue.clamp(widget.min, widget.max);
    if (_currentValue != clampedValue) {
      setState(() {
        _currentValue = clampedValue;
      });
      widget.onChanged(clampedValue);
    }
  }

  double _getPosition(double value) {
    if (widget.max == widget.min) return 0.0;
    return ((value - widget.min) / (widget.max - widget.min)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final position = _getPosition(_currentValue);
    final activeColor = widget.activeTrackColor ??
        Color.lerp(widget.trackColor, const Color(0xFF4CAF50), 0.3) ??
        const Color(0xFF4CAF50);
    final borderWidth = 2.5;
    final thumbScale = _isDragging ? 1.15 : (_isHovering ? 1.08 : 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Stack coordinate system: 0 to (constraints.maxWidth - shadowOffset)
        // Track extends from 0 to (constraints.maxWidth - shadowOffset) + shadowOffset visually
        // Track's right edge in Stack coordinates is at (constraints.maxWidth - shadowOffset)
        final stackWidth = constraints.maxWidth - widget.shadowOffset;
        // Track visual width extends to constraints.maxWidth, but in Stack coords it's stackWidth
        // Thumb should align with track edges: left at 0, right at stackWidth
        final trackWidth = stackWidth;
        // Position thumb so its edges align with track edges at min/max
        // At position 0: thumb left edge at track left edge (0)
        // At position 1: thumb right edge at track right edge (trackWidth)
        final thumbLeftMin = 0.0;
        final thumbLeftMax = trackWidth - widget.thumbSize;
        final thumbLeftPosition =
            thumbLeftMin + (thumbLeftMax - thumbLeftMin) * position;
        final thumbCenterPosition = thumbLeftPosition + widget.thumbSize / 2;

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: GestureDetector(
            onPanStart: (details) {
              setState(() => _isDragging = true);
              _handleDrag(
                  details.localPosition, trackWidth, widget.shadowOffset);
            },
            onPanUpdate: (details) {
              _handleDrag(
                  details.localPosition, trackWidth, widget.shadowOffset);
            },
            onPanEnd: (_) {
              setState(() => _isDragging = false);
            },
            onTapDown: (details) {
              _handleDrag(
                  details.localPosition, trackWidth, widget.shadowOffset);
            },
            child: Container(
              height: widget.height +
                  (widget.shadowOffset * 2) +
                  (widget.showValueIndicator ? 30.0 : 0.0),
              padding: EdgeInsets.only(
                left: widget.shadowOffset,
                top: widget.shadowOffset +
                    (widget.showValueIndicator ? 30.0 : 0.0),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Shadow layer (black background)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: -widget.shadowOffset,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(widget.height / 2),
                      ),
                    ),
                  ),
                  // Track (background)
                  Positioned(
                    left: 0,
                    top: 0,
                    right: -widget.shadowOffset,
                    bottom: -widget.shadowOffset,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.trackColor,
                        borderRadius: BorderRadius.circular(widget.height / 2),
                        border:
                            Border.all(color: Colors.black, width: borderWidth),
                      ),
                    ),
                  ),
                  // Active track (filled portion) with gradient effect
                  Positioned(
                    left: 0,
                    top: 0,
                    width: thumbCenterPosition,
                    bottom: -widget.shadowOffset,
                    child: Container(
                      decoration: BoxDecoration(
                        color: activeColor,
                        borderRadius: BorderRadius.circular(widget.height / 2),
                        border: Border(
                          left: BorderSide(
                              color: Colors.black, width: borderWidth),
                          top: BorderSide(
                              color: Colors.black, width: borderWidth),
                          bottom: BorderSide(
                              color: Colors.black, width: borderWidth),
                        ),
                      ),
                    ),
                  ),
                  // Thumb (slider handle)
                  Positioned(
                    left: thumbLeftPosition,
                    top: (widget.height - widget.thumbSize) / 2,
                    child: AnimatedScale(
                      scale: thumbScale,
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeOut,
                      child: AnimatedContainer(
                        duration: _isDragging
                            ? Duration.zero
                            : const Duration(milliseconds: 200),
                        curve: Curves.easeOutCubic,
                        width: widget.thumbSize,
                        height: widget.thumbSize,
                        decoration: BoxDecoration(
                          color: widget.thumbColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: borderWidth,
                          ),
                          boxShadow: _isDragging
                              ? []
                              : [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(
                                      widget.shadowOffset,
                                      widget.shadowOffset,
                                    ),
                                    blurRadius: 0,
                                  ),
                                ],
                        ),
                        transform: Matrix4.translationValues(
                          _isDragging ? widget.shadowOffset : 0,
                          _isDragging ? widget.shadowOffset : 0,
                          0,
                        ),
                        child: widget.thumbInnerColor != null
                            ? Center(
                                child: Container(
                                  width: widget.thumbSize * 0.4,
                                  height: widget.thumbSize * 0.4,
                                  decoration: BoxDecoration(
                                    color: widget.thumbInnerColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  // Value indicator
                  if (widget.showValueIndicator)
                    Positioned(
                      left: thumbCenterPosition - 20,
                      top: -28,
                      child: AnimatedOpacity(
                        opacity: _isDragging || _isHovering ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 150),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(widget.shadowOffset / 2,
                                    widget.shadowOffset / 2),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Text(
                            _currentValue.toStringAsFixed(
                              widget.divisions != null ? 0 : 1,
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleDrag(
      Offset localPosition, double trackWidth, double paddingLeft) {
    // Convert localPosition from Container coordinates to Stack coordinates
    // The Container has padding, so we need to subtract it
    final stackX = (localPosition.dx - paddingLeft).clamp(0.0, trackWidth);

    // Calculate position based on thumb edge alignment
    // Track goes from 0 to trackWidth in the Stack coordinate system
    final thumbLeftMin = 0.0;
    final thumbLeftMax = trackWidth - widget.thumbSize;
    final thumbLeftRange = thumbLeftMax - thumbLeftMin;

    // Calculate position based on thumb center for better UX
    // User clicks/drags on the thumb center, so we calculate from center
    final thumbCenter = widget.thumbSize / 2;
    final clampedX = stackX.clamp(thumbCenter, trackWidth - thumbCenter);

    // Convert from center-based to left-edge-based position
    final thumbLeftFromCenter = clampedX - thumbCenter;
    double newPosition = thumbLeftRange > 0
        ? (thumbLeftFromCenter - thumbLeftMin) / thumbLeftRange
        : 0.0;
    newPosition = newPosition.clamp(0.0, 1.0);

    final newValue = widget.min + (newPosition * (widget.max - widget.min));

    if (widget.divisions != null) {
      final step = (widget.max - widget.min) / widget.divisions!;
      final steppedValue = (newValue / step).round() * step;
      _updateValue(steppedValue);
    } else {
      _updateValue(newValue);
    }
  }
}
