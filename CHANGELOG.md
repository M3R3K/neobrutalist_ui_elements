## 1.0.2(11-01-2026)
- **Enhanced NeoToast widget**: Made `ToastNeoService.show()` fully customizable with new optional parameters:
  - Added `backgroundColor`, `shadowColor`, `buttonColor` for color customization
  - Added `textStyle` for custom message text styling
  - Added `icon` parameter for optional icon display
  - Added `height`, `borderRadius`, `borderThickness`, `borderChin` for size and styling control
  - Added `hasButton`, `buttonMessage`, `onPressed` for action button customization
  - Added `duration` parameter to control auto-dismiss timing (defaults to 3 seconds)
  - Added `position` parameter with `ToastPosition` enum (top/bottom) for toast placement
  - Added `animationDuration` for custom animation timing
  - Renamed `NeoToastService` to `ToastNeoService` for consistency
- Backward compatibility maintained - simple `show()` call still works with defaults

## 1.0.1(09-01-2026)
- Fixed documentation in README.md

## 1.0.0(09-01-2026)
- **BREAKING CHANGE**: Renamed `ContainerNeo` to `NeoContainer` for consistency with naming convention
- **BREAKING CHANGE**: Renamed `InputField` to `NeoInputField` for consistency with naming convention
- **BREAKING CHANGE**: Renamed `TextContainer` to `NeoTextContainer` for consistency with naming convention
- Added `NeoLoadingIndicator` widget - a new loading indicator in neobrutalist style with customizable size, color, stroke width, shadow offset, border radius, and animation duration
- Added `NeoDialog` widget - a neobrutalist-style dialog with customizable title, content, background color, and action buttons
- Added `NeoToast` widget - a toast notification component with slide and fade animations, customizable colors, and optional action buttons
- Added `NeoWindow` widget - a Windows 95-style window component with title bar, close button, and customizable content
- Added `NeoSlider` widget - a neobrutalist slider with customizable track colors, thumb size, shadow offset, and value indicator
- Added comprehensive showcase page in example app demonstrating all widgets in a single scrollable view

## 0.2.1(03-01-2026)
- Minor bugfixes


## 0.2.0(27-12-2025)
- Updated the gradle version of the example project.
- ContainerNeo Press animation causing page layout to shift has been fixed. Animation logic overhauled and is no longer gets stuck on pressed state.
- InputField: Autocorrect and suggestions are disabled when the text is obscured. Added an option to change the keyboard type and customize the text styles of hint and input texts.
- NeoCircleIconButton: Added a pressing down animation.

## 0.1.0(28-02-2025)
- Added 3 new widgets `NeoCircleIconButton` , `NeoSegmentedOptions` and `NeoSwitch`
- Integrated better performance optimizations and bug fixes.
- Changed the widget constructor requirements that introduce optional fields for widgets.

## 0.0.1(10-02-2025)

- This is the very first release of Neobrutalist UI Elements library.
- Shadowy Container, Neo Container and Input Field are added.
