import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeoSegmentedOptions extends StatefulWidget {
  NeoSegmentedOptions(
      {required this.numberOfOptions,
      required this.height,
      required this.optionWidgets,
      this.activeColor,
      this.inactiveColor,
      this.highlightColor,
      this.splashColor,
      this.crossAxisAlignment,
      this.selectedOption,
      required this.onOptionSelected,
      this.borderThickness,
      this.mainAxisAlignment,
      required this.width,
      super.key});
  final int numberOfOptions;
  final List<Widget> optionWidgets;
  final double width;
  final double? borderThickness;
  int? selectedOption;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Function onOptionSelected;

  final double height;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  State<NeoSegmentedOptions> createState() => _NeoSegmentedOptionsState();
}

class _NeoSegmentedOptionsState extends State<NeoSegmentedOptions> {
  @override
  Widget build(BuildContext context) {
    List<Widget> containerWrappedOptions = List.generate(
      widget.numberOfOptions,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.selectedOption == index
              ? widget.activeColor ?? Colors.green
              : widget.inactiveColor ?? Colors.grey[300],
          border: Border(
              right: index == widget.numberOfOptions - 1
                  ? BorderSide.none
                  : BorderSide(color: Colors.black, width: widget.width / 60)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor:
                widget.splashColor ?? const Color.fromARGB(70, 115, 115, 115),
            highlightColor: widget.highlightColor ??
                const Color.fromARGB(70, 115, 115, 115),
            onTap: () {
              setState(() {
                widget.selectedOption = index;
              });
              widget.onOptionSelected(index, context);
              debugPrint('Option $index selected');
            },
            child: Center(
              child: widget.optionWidgets[index],
            ),
          ),
        ),
      ),
    );
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: widget.borderThickness ?? 2,
          horizontal: widget.borderThickness ?? 2),
      width: widget.width * widget.numberOfOptions +
          (widget.borderThickness == null ? 4 : widget.borderThickness! * 2),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black, // Shadow color
            offset:
                Offset(widget.height / 25, widget.height / 25), // Shadow offset
          ),
        ],
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment:
            widget.crossAxisAlignment ?? CrossAxisAlignment.center,
        children: containerWrappedOptions,
      ),
    );
  }
}
