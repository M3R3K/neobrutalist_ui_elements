import 'package:flutter/material.dart';

/// A neobrutalist toggle switch widget with customizable colors and animations.
///
/// This widget creates a switch with:
/// - Two distinct colors for on/off states
/// - Smooth sliding animation
/// - Optional shadow effect
/// - Customizable border radius
///
/// Example:
/// ```dart
/// NeoSwitch(
///   onChanged: (value, context) {
///     print('Switch: $value');
///   },
///   defaultState: false,
///   width: 110,
///   height: 50,
///   falseColor: Colors.grey,
///   trueColor: const Color(0xFFFFA6F6),
///   borderRadius: BorderRadius.circular(30),
///   optionalShadowOffset: 4,
///   animationDuration: const Duration(milliseconds: 180),
/// )
/// ```
// ignore: must_be_immutable
class NeoSwitch extends StatefulWidget {
  /// Creates a neobrutalist switch.
  ///
  /// The [width], [onChanged], [height], [falseColor], and [trueColor] parameters are required.
  NeoSwitch(
      {required this.width,
      required this.onChanged,
      required this.height,
      required this.falseColor,
      required this.trueColor,
      this.optionalShadowOffset,
      this.animationDuration,
      this.defaultState,
      this.borderRadius,
      super.key});

  /// The width of the switch.
  final double width;

  /// The height of the switch.
  final double height;

  /// The color when the switch is in the false/off state.
  final Color falseColor;

  /// The color when the switch is in the true/on state.
  final Color trueColor;

  /// The initial state of the switch.
  ///
  /// If null, defaults to false.
  final bool? defaultState;

  /// Callback function called when the switch state changes.
  ///
  /// Receives the new boolean value and BuildContext as parameters.
  final Function(bool, BuildContext) onChanged;

  /// The duration of the animation when toggling.
  ///
  /// If null, defaults to 180 milliseconds.
  Duration? animationDuration;

  /// The border radius of the switch.
  ///
  /// If null, the switch will have sharp corners.
  BorderRadius? borderRadius;

  /// Optional shadow offset for the switch.
  ///
  /// If provided, creates a hard black shadow effect.
  /// If null, no shadow is displayed.
  double? optionalShadowOffset;

  @override
  State<NeoSwitch> createState() => _NeoSwitchState();
}

class _NeoSwitchState extends State<NeoSwitch> {
  late Color _switchColor;
  late bool _switchState;
  @override
  void initState() {
    super.initState();
    if (widget.defaultState != null) {
      _switchColor =
          widget.defaultState! ? widget.trueColor : widget.falseColor;
      _switchState = widget.defaultState!;
    } else {
      _switchColor = widget.falseColor;
      _switchState = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _switchState = !_switchState;
          _switchColor = _switchColor == widget.falseColor
              ? widget.trueColor
              : widget.falseColor;
        });
        widget.onChanged(_switchState, context);
        debugPrint('Switch state: $_switchState');
      },
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(
            milliseconds: widget.animationDuration != null
                ? widget.animationDuration!.inMilliseconds
                : 180),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          boxShadow: widget.optionalShadowOffset != null
              ? [
                  BoxShadow(
                    color: Colors.black, // Shadow color
                    offset: Offset(widget.optionalShadowOffset!,
                        widget.optionalShadowOffset!), // Shadow offset
                  ),
                ]
              : null,
          color: _switchColor,
          border: Border.all(color: Colors.black, width: widget.height / 30),
          borderRadius: widget.borderRadius,
        ),
        child: AnimatedContainer(
          padding: EdgeInsets.all(widget.height / 15),
          duration: Duration(
              milliseconds: widget.animationDuration != null
                  ? widget.animationDuration!.inMilliseconds
                  : 180),
          curve: Curves.easeInOut,
          alignment:
              _switchState ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: widget.height / 1.2,
            height: widget.height / 1.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border:
                  Border.all(color: Colors.black, width: widget.height / 30),
            ),
          ),
        ),
      ),
    );
  }
}
