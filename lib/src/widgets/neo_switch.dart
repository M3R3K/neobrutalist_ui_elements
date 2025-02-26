import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeoSwitch extends StatefulWidget {
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
  final double width;
  final double height;
  final Color falseColor;
  final Color trueColor;
  final bool? defaultState;
  final Function(bool, BuildContext) onChanged;
  Duration? animationDuration;
  BorderRadius? borderRadius;
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
