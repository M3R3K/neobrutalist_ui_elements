

This is a flutter package that aims to create beautiful, customizable and reusable UI elements that use "Neo Brutalistic" design language. It contains easy to use elements for developing beautiful UI pages.

## Features

- **NeoContainer** - Main container element with customizable animations, shapes, and shadow effects
- **NeoInputField** - Input field with controller support and customizable styling
- **NeoTextContainer** - Text container with Neo Brutalistic shadow
- **NeoCircleIconButton** - Circular icon button with press animations
- **NeoSwitch** - Toggle switch with customizable colors and animations
- **NeoSegmentedOptions** - Segmented control for multiple options
- **NeoDialog** - Neobrutalist-style dialog with customizable content and buttons
- **NeoToast** - Toast notification component with slide and fade animations
- **NeoWindow** - Windows 95-style window component with title bar
- **NeoSlider** - Slider with customizable track colors, thumb size, and value indicator
- **NeoLoadingIndicator** - Loading indicator with customizable size, color, and animation duration

## Usage

<table>

<tr>

<td>

```dart
NeoContainer(
                    offset: 3,
                    animate: true,
                    padding: const EdgeInsets.all(16),
                    bgcolor: const Color(0xFFFFD93D),
                    borderRadius: 8,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ContainerNeo pressed!'),
                          duration: Duration(milliseconds: 1500),
                        ),
                      );
                    },
                    child: const Text(
                      'Clickable Neo Container',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
```
</td>

<td>
<img src="https://raw.githubusercontent.com/M3R3K/neobrutalist_ui_elements/refs/heads/main/demo.gif" alt="">



</td>
</tr>


## Additional information

This package is published on  <a href="https://pub.dev/packages/neobrutalist_ui_elements">pub.dev!</a> 
