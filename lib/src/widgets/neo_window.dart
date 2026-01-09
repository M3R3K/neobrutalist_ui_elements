import 'package:flutter/material.dart';

/// A Windows 95-style window component with title bar and close button.
///
/// This widget creates a retro-style window with:
/// - Classic grey window frame
/// - Customizable title bar color
/// - Minimize and close buttons
/// - Hard black shadow effect
/// - White content area with black border
///
/// Example:
/// ```dart
/// NeoWindow95(
///   title: 'Neobrutalist Window',
///   titleBarColor: const Color(0xFF3AC1FF),
///   width: 400,
///   onClose: () {
///     print('Window closed');
///   },
///   child: const Padding(
///     padding: EdgeInsets.all(16),
///     child: Text('Window content here'),
///   ),
/// )
/// ```
class NeoWindow95 extends StatelessWidget {
  /// Creates a Windows 95-style window.
  ///
  /// The [title], [child], [titleBarColor], and [width] parameters are required.
  const NeoWindow95({
    super.key,
    required this.title,
    required this.child,
    required this.titleBarColor,
    this.onClose,
    required this.width,
  });

  /// The title text displayed in the title bar.
  final String title;

  /// The content widget displayed in the window.
  final Widget child;

  /// The background color of the title bar.
  final Color titleBarColor;

  /// Callback function called when the close button is pressed.
  final VoidCallback? onClose;

  /// The width of the window.
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xFFC0C0C0), // Classic Grey
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4), // Neobrutalist hard shadow
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TITLE BAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: titleBarColor,
              border: const Border(
                bottom: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.computer, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'monospace', // For that retro feel
                    ),
                  ),
                ),
                // WINDOW BUTTONS
                _Win95Button(
                  icon: Icons.minimize,
                  size: 14,
                  onTap: onClose,
                ),
                const SizedBox(width: 2),
                const SizedBox(width: 2),
                _Win95Button(
                  icon: Icons.close,
                  size: 14,
                  onTap: onClose,
                ),
              ],
            ),
          ),

          // MAIN CONTENT AREA
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class _Win95Button extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback? onTap;

  const _Win95Button({required this.icon, required this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: const Color(0xFFC0C0C0),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Icon(icon, size: size, color: Colors.black),
      ),
    );
  }
}
