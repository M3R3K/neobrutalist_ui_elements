// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';

class ContainerNeo extends StatefulWidget {
  ContainerNeo(
      {super.key,
      required this.bgcolor,
      required this.animate,
      required this.child,
      required this.borderRadius,
      required this.defaultPaddingBottom,
      required this.defaultPaddingRight,
      this.padding,
      this.onLongPressed,
      this.onPressed});
  final Color bgcolor;
  final Widget child;
  final double borderRadius;
  final Function? onPressed;
  final Function? onLongPressed;
  double defaultPaddingBottom;
  double defaultPaddingRight;
  double? previousPaddingBottom;
  double? previousPaddingRight;
  final bool animate;
  final EdgeInsets? padding;
  @override
  State<ContainerNeo> createState() => _ContainerNeoState();
}

class _ContainerNeoState extends State<ContainerNeo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {});
      },
      onTap: () {
        if (widget.animate) {
          setState(() {
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
            widget.previousPaddingBottom = widget.defaultPaddingBottom;
            widget.previousPaddingRight = widget.defaultPaddingRight;
            widget.defaultPaddingBottom = 0;
            widget.defaultPaddingRight = 0;

            Timer(const Duration(milliseconds: 160), () {
              setState(() {
                widget.defaultPaddingBottom = widget.previousPaddingBottom!;
                widget.defaultPaddingRight = widget.previousPaddingRight!;
              });
            });
          });
        }
      },
      onTapCancel: () {
        if (widget.animate) {
          setState(() {
            widget.defaultPaddingBottom = widget.previousPaddingBottom!;
            widget.defaultPaddingRight = widget.previousPaddingRight!;
          });
        }
      },
      onTapDown: (_) {
        if (widget.animate) {
          setState(() {
            widget.previousPaddingBottom = widget.defaultPaddingBottom;
            widget.previousPaddingRight = widget.defaultPaddingRight;
            widget.defaultPaddingBottom = 0;
            widget.defaultPaddingRight = 0;
          });
        }
      },
      onTapUp: (_) {
        if (widget.animate) {
          setState(() {
            widget.defaultPaddingBottom = widget.previousPaddingBottom!;
            widget.defaultPaddingRight = widget.previousPaddingRight!;
          });
        }
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(
            right: widget.defaultPaddingBottom,
            bottom: widget.defaultPaddingBottom),
        duration: const Duration(milliseconds: 80),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Container(
            padding: widget.padding ?? const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: widget.bgcolor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            child: widget.child),
      ),
    );
  }
}
