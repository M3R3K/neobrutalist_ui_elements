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
    required this.animation,
    required this.onClose,
    this.height,
    this.onPressed,
    this.shadowColor,
    this.icon,
    super.key,
    this.buttonMessage,
    this.borderRadius,
    this.borderThickness,
    this.borderChin,
    this.textStyle,
    this.buttonColor,
    this.position,
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

  /// Custom text style for the message text.
  final TextStyle? textStyle;

  /// Color of the action button. Defaults to amber if not provided.
  final Color? buttonColor;

  /// Position of the toast (for animation direction). Defaults to bottom.
  final ToastPosition? position;

  @override
  Widget build(BuildContext context) {
    // Slide transition: direction depends on position
    final slideBegin =
        (position ?? ToastPosition.bottom) == ToastPosition.bottom
            ? const Offset(0, 1) // Slide up from bottom
            : const Offset(0, -1); // Slide down from top

    final offsetAnimation = Tween<Offset>(
      begin: slideBegin,
      end: Offset.zero,
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
                    style: textStyle ??
                        const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                  ),
                ),
                if (hasButton) ...[
                  SizedBox(width: 5),
                  NeoContainer(
                    onPressed: onPressed,
                    bgcolor: buttonColor ?? Colors.amber,
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
/// - Auto-dismiss after customizable duration
///
/// Example:
/// ```dart
/// ToastNeoService.show(
///   context,
///   'This is a neobrutalist toast!',
/// );
///
/// // With customization:
/// ToastNeoService.show(
///   context,
///   'Custom toast!',
///   backgroundColor: Colors.blue,
///   hasButton: true,
///   icon: Icons.info,
///   duration: Duration(seconds: 5),
/// );
/// ```
class ToastNeoService {
  /// Shows a neobrutalist toast notification.
  ///
  /// The toast will automatically dismiss after the specified [duration]
  /// (defaults to 3 seconds).
  ///
  /// [context] - The BuildContext to show the toast in.
  /// [message] - The message text to display in the toast.
  /// [backgroundColor] - The background color of the toast. Defaults to high-vis green.
  /// [hasButton] - Whether to show an action button. Defaults to true.
  /// [buttonMessage] - The text on the action button. Defaults to "View".
  /// [icon] - Optional icon to display at the start of the message.
  /// [height] - The height of the toast. Defaults to 65.
  /// [borderRadius] - The border radius of the toast. Defaults to 4.
  /// [borderThickness] - The thickness of the border. Defaults to 2.
  /// [borderChin] - The offset of the shadow effect. Defaults to 4.
  /// [shadowColor] - The color of the shadow. Defaults to black.
  /// [onPressed] - Callback when the action button is pressed.
  /// [duration] - How long the toast stays visible before auto-dismissing. Defaults to 3 seconds.
  /// [position] - Where to position the toast. Defaults to bottom.
  /// [textStyle] - Custom text style for the message.
  /// [buttonColor] - Color of the action button. Defaults to amber.
  /// [animationDuration] - Duration of the show/hide animation. Defaults to 600ms.
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    bool? hasButton,
    String? buttonMessage,
    IconData? icon,
    double? height,
    double? borderRadius,
    double? borderThickness,
    double? borderChin,
    Color? shadowColor,
    Function? onPressed,
    Duration? duration,
    ToastPosition position = ToastPosition.bottom,
    TextStyle? textStyle,
    Color? buttonColor,
    Duration? animationDuration,
  }) {
    final overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    // We use a separate stateful widget to manage the controller
    overlayEntry = OverlayEntry(
      builder: (context) => _ToastAnimateWrapper(
        message: message,
        backgroundColor: backgroundColor,
        hasButton: hasButton,
        buttonMessage: buttonMessage,
        icon: icon,
        height: height,
        borderRadius: borderRadius,
        borderThickness: borderThickness,
        borderChin: borderChin,
        shadowColor: shadowColor,
        onPressed: onPressed,
        duration: duration,
        position: position,
        textStyle: textStyle,
        buttonColor: buttonColor,
        animationDuration: animationDuration,
        onDismiss: () => overlayEntry.remove(),
      ),
    );

    overlayState.insert(overlayEntry);
  }
}

/// Position where the toast notification should appear.
enum ToastPosition {
  /// Toast appears at the top of the screen.
  top,

  /// Toast appears at the bottom of the screen.
  bottom,
}

class _ToastAnimateWrapper extends StatefulWidget {
  final String message;
  final Color? backgroundColor;
  final bool? hasButton;
  final String? buttonMessage;
  final IconData? icon;
  final double? height;
  final double? borderRadius;
  final double? borderThickness;
  final double? borderChin;
  final Color? shadowColor;
  final Function? onPressed;
  final Duration? duration;
  final ToastPosition position;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Duration? animationDuration;
  final VoidCallback onDismiss;

  const _ToastAnimateWrapper({
    required this.message,
    this.backgroundColor,
    this.hasButton,
    this.buttonMessage,
    this.icon,
    this.height,
    this.borderRadius,
    this.borderThickness,
    this.borderChin,
    this.shadowColor,
    this.onPressed,
    this.duration,
    this.position = ToastPosition.bottom,
    this.textStyle,
    this.buttonColor,
    this.animationDuration,
    required this.onDismiss,
  });

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
      duration: widget.animationDuration ?? const Duration(milliseconds: 600),
    );

    _controller.forward();

    // Auto-dismiss after specified duration
    Future.delayed(widget.duration ?? const Duration(seconds: 3), () {
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
      bottom: widget.position == ToastPosition.bottom ? 40 : null,
      top: widget.position == ToastPosition.top ? 40 : null,
      left: 0,
      right: 0,
      child: ToastNeo(
        message: widget.message,
        backgroundColor: widget.backgroundColor ?? const Color(0xFF00FF90),
        hasButton: widget.hasButton ?? true,
        buttonMessage: widget.buttonMessage,
        icon: widget.icon,
        height: widget.height,
        borderRadius: widget.borderRadius,
        borderThickness: widget.borderThickness,
        borderChin: widget.borderChin,
        shadowColor: widget.shadowColor,
        onPressed: widget.onPressed,
        animation: _controller,
        onClose: _dismiss,
        textStyle: widget.textStyle,
        buttonColor: widget.buttonColor,
        position: widget.position,
      ),
    );
  }
}
