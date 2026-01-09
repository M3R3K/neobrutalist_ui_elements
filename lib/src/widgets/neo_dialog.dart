import 'package:flutter/material.dart';

/// A neobrutalist dialog widget with customizable title, content, and action buttons.
///
/// This widget creates a dialog with:
/// - Hard black shadow effect (8, 8 offset)
/// - Bold black border (4px width)
/// - Customizable background color
/// - Square corners (no border radius)
///
/// Example:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => NeoDialog(
///     title: const Text(
///       'NEO DIALOG',
///       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
///     ),
///     content: const Text('This is a neobrutalist dialog!'),
///     backgroundColor: const Color(0xFFFF6B6B),
///     buttons: Row(
///       mainAxisAlignment: MainAxisAlignment.center,
///       children: [
///         NeoContainer(
///           bgcolor: Colors.grey,
///           animate: true,
///           onPressed: () => Navigator.of(context).pop(),
///           borderRadius: 4,
///           offset: 2,
///           child: const Padding(
///             padding: EdgeInsets.all(8),
///             child: Text('Cancel'),
///           ),
///         ),
///       ],
///     ),
///   ),
/// )
/// ```
class NeoDialog extends StatelessWidget {
  /// Creates a neobrutalist dialog.
  ///
  /// The [title], [buttons], and [content] parameters are required.
  const NeoDialog({
    super.key,
    required this.title,
    required this.buttons,
    this.titleMargin = 10.0,
    this.backgroundColor = const Color(0xFFADFF2F),
    this.contentMargin = 24,
    required this.content,
  });

  /// The title text widget displayed at the top of the dialog.
  final Text title;

  /// The margin between the title and content.
  ///
  /// Defaults to 10.0.
  final double titleMargin;

  /// The margin between the content and buttons.
  ///
  /// Defaults to 24.0.
  final double contentMargin;

  /// The background color of the dialog.
  ///
  /// Defaults to Color(0xFFADFF2F) (lime green).
  final Color backgroundColor;

  /// The main content widget of the dialog.
  final Widget content;

  /// The action buttons widget (typically a Row of buttons).
  final Widget buttons;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Colors.black, width: 4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(8, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title,
            SizedBox(height: titleMargin),
            content,
            SizedBox(height: contentMargin),
            // Reusing your custom button
            buttons,
          ],
        ),
      ),
    );
  }
}
