import 'package:flutter/material.dart';
import 'package:neobrutalist_ui_elements/neobrutalist_ui_elements.dart';

/// A neobrutalist-style toast notification widget.
///
/// This widget displays a toast notification with:
/// - Slide and fade animations
/// - Hard black shadow effect (border chin)
/// - Customizable colors and styling
/// - Optional action button
/// - Close button
///
/// Example:
/// ```dart
/// ToastNeo(
///   message: 'Hello, World!',
///   backgroundColor: Colors.amber,
///   hasButton: true,
///   animation: animationController,
///   onClose: () => print('Closed'),
/// )
/// ```
class ToastNeo extends StatelessWidget {
  /// Creates a neobrutalist toast notification widget.
  ///
  /// The [backgroundColor], [message], [hasButton], [animation], and [onClose]
  /// parameters are required. All other parameters are optional.
  const ToastNeo({
    required this.backgroundColor,
    required this.message,
    required this.hasButton,
    required this.animation, // Added animation parameter
    required this.onClose, // Added callback
    this.height,
    this.onPressed,
    this.shadowColor,
    this.icon,
    super.key,
    this.buttonMessage,
    this.borderRadius,
    this.borderThickness,
    this.borderChin,
  });

  /// The background color of the toast notification.
  final Color backgroundColor;

  /// Whether to display an action button in the toast.
  final bool hasButton;

  /// The text to display on the action button. Only used if [hasButton] is true.
  final String? buttonMessage;

  /// The color of the shadow (border chin) effect. Defaults to black if not provided.
  final Color? shadowColor;

  /// An optional icon to display at the start of the toast message.
  final IconData? icon;

  /// The main message text to display in the toast.
  final String message;

  /// The height of the toast. Defaults to 65 if not provided.
  final double? height;

  /// The border radius of the toast corners. Defaults to 4 if not provided.
  final double? borderRadius;

  /// The thickness of the border. Defaults to 2 if not provided.
  final double? borderThickness;

  /// The offset of the shadow (border chin) effect. Defaults to 4 if not provided.
  final double? borderChin;

  /// The animation controller for fade and slide transitions of the toast.
  final Animation<double> animation;

  /// Optional callback function called when the action button is pressed.
  final Function? onPressed;

  /// Callback function called when the close button is pressed or the toast is dismissed.
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    // Slide transition: starts from 100 pixels below its position
    final offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves
          .fastEaseInToSlowEaseOut, // Neobrutalism feels great with "bouncy" curves
    ));

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: offsetAnimation,
        child: Material(
          // Wrap in Material to support Text/Icons properly in Overlay
          color: Colors.transparent,
          child: Container(
            height: height ?? 65,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              border:
                  Border.all(color: Colors.black, width: borderThickness ?? 2),
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                      0, borderChin ?? 4), // Increased for "thicker" look
                  color: shadowColor ?? Colors.black,
                  blurRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.black),
                  const SizedBox(width: 10),
                ],
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ),
                if (hasButton) ...[
                  NeoContainer(
                    onPressed: onPressed,
                    bgcolor: Colors.amber,
                    animate: true,
                    borderRadius: 4,
                    offset: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        buttonMessage ?? "View",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Service class for displaying neobrutalist toast notifications.
///
/// This service provides a simple way to show toast notifications with:
/// - Slide and fade animations
/// - Hard black shadow effect
/// - Customizable colors
/// - Optional action button
/// - Auto-dismiss after 3 seconds
///
/// Example:
/// ```dart
/// NeoToastService.show(
///   context,
///   'This is a neobrutalist toast!',
/// );
/// ```
class NeoToastService {
  /// Shows a neobrutalist toast notification.
  ///
  /// The toast will automatically dismiss after 3 seconds.
  ///
  /// [context] - The BuildContext to show the toast in.
  /// [message] - The message text to display in the toast.
  static void show(BuildContext context, String message) {
    final overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    // We use a separate stateful widget to manage the controller
    overlayEntry = OverlayEntry(
      builder: (context) => _ToastAnimateWrapper(
        message: message,
        onDismiss: () => overlayEntry.remove(),
      ),
    );

    overlayState.insert(overlayEntry);
  }
}

class _ToastAnimateWrapper extends StatefulWidget {
  final String message;
  final VoidCallback onDismiss;

  const _ToastAnimateWrapper({required this.message, required this.onDismiss});

  @override
  State<_ToastAnimateWrapper> createState() => _ToastAnimateWrapperState();
}

class _ToastAnimateWrapperState extends State<_ToastAnimateWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _controller.forward();

    // Auto-dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) _dismiss();
    });
  }

  void _dismiss() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40, // Position at bottom
      left: 0,
      right: 0,
      child: ToastNeo(
        message: widget.message,
        backgroundColor: const Color(0xFF00FF90), // High-vis Green
        hasButton: true,
        animation: _controller,
        onClose: _dismiss,
      ),
    );
  }
}
