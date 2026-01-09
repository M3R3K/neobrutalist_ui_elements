import 'package:flutter/material.dart';

/// A neobrutalist segmented control widget for selecting between multiple options.
///
/// This widget creates a segmented control with:
/// - Distinct active and inactive colors
/// - Hard black shadow effect
/// - Smooth color transitions
/// - Customizable option widgets
///
/// Example:
/// ```dart
/// NeoSegmentedOptions(
///   onOptionSelected: (index, context) {
///     print('Option $index selected');
///   },
///   width: 100,
///   height: 50,
///   borderThickness: 2,
///   numberOfOptions: 3,
///   selectedOption: 1,
///   activeColor: const Color(0xFFA8A6FF),
///   optionWidgets: [
///     const Text('Option 1', style: TextStyle(fontWeight: FontWeight.bold)),
///     const Text('Option 2', style: TextStyle(fontWeight: FontWeight.bold)),
///     const Text('Option 3', style: TextStyle(fontWeight: FontWeight.bold)),
///   ],
/// )
/// ```
// ignore: must_be_immutable
class NeoSegmentedOptions extends StatefulWidget {
  /// Creates a neobrutalist segmented options widget.
  ///
  /// The [numberOfOptions], [height], [optionWidgets], [onOptionSelected], and [width] parameters are required.
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

  /// The number of options in the segmented control.
  final int numberOfOptions;

  /// The list of widgets to display for each option.
  ///
  /// Must have exactly [numberOfOptions] widgets.
  final List<Widget> optionWidgets;

  /// The width of each option segment.
  final double width;

  /// The thickness of the border around the entire widget.
  ///
  /// If null, defaults to 2.
  final double? borderThickness;

  /// The currently selected option index.
  ///
  /// Can be changed programmatically or by user interaction.
  int? selectedOption;

  /// The color of the active/selected option.
  ///
  /// If null, defaults to Colors.green.
  final Color? activeColor;

  /// The color of inactive options.
  ///
  /// If null, defaults to Colors.grey[300].
  final Color? inactiveColor;

  /// The splash color when an option is tapped.
  ///
  /// If null, defaults to a semi-transparent grey.
  final Color? splashColor;

  /// The highlight color when an option is pressed.
  ///
  /// If null, defaults to a semi-transparent grey.
  final Color? highlightColor;

  /// Callback function called when an option is selected.
  ///
  /// Receives the selected index and BuildContext as parameters.
  final Function onOptionSelected;

  /// The height of each option segment.
  final double height;

  /// The main axis alignment of the options.
  ///
  /// If null, defaults to MainAxisAlignment.center.
  final MainAxisAlignment? mainAxisAlignment;

  /// The cross axis alignment of the options.
  ///
  /// If null, defaults to CrossAxisAlignment.center.
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
