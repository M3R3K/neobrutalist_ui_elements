import 'package:flutter/material.dart';

class NeoCircleIconButon extends StatefulWidget {
  NeoCircleIconButon({
    super.key,
    this.splashColor,
    this.highlightColor,
    required this.padding,
    required this.icon,
    required this.backgroundColor,
    required this.offsetA,
    required this.offsetB,
    required this.onPressed,
  });
  final EdgeInsets padding;
  double offsetA;
  double offsetB;
  final Icon icon;
  final Color backgroundColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Function()? onPressed;

  @override
  State<NeoCircleIconButon> createState() => _NeoCircleIconButonState();
}

class _NeoCircleIconButonState extends State<NeoCircleIconButon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black, // Shadow color
              offset: Offset(widget.offsetA, widget.offsetB), // Shadow offset
            ),
          ],
          color: widget.backgroundColor,
          border: Border.all(color: Colors.black, width: 2),
          shape: BoxShape.circle),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: widget.splashColor ?? const Color.fromARGB(104, 0, 0, 0),
          highlightColor: widget.highlightColor,
          customBorder: const CircleBorder(),
          onTap: () {
            widget.onPressed!();
          },
          child: Padding(
            padding: widget.padding,
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
