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

**Neobrutalist UI Elements** is a comprehensive Flutter package that brings the bold, unapologetic aesthetic of neobrutalism to mobile and web applications. This design philosophy embraces raw, honest design with hard shadows, bold borders, vibrant colors, and geometric shapes that reject the minimalist trends of modern UI design. The package provides developers with a complete set of customizable widgets that make it easy to create striking, memorable user interfaces that stand out from the crowd.

The package is built with Flutter developers in mind, offering a collection of 11 carefully crafted widgets that cover the essential UI components needed for modern applications. Each widget is fully customizable, allowing developers to adjust colors, sizes, animations, and styling to match their specific design requirements. Whether you're building a mobile app, a web application, or a desktop interface, these widgets provide consistent neobrutalist styling across all platforms. The design language emphasizes functionality and clarity through bold visual statements, making interfaces not just usable, but visually engaging and distinctive.
</td>

<td>



https://github.com/user-attachments/assets/5f3f61f5-96e9-4e5d-9bc3-829096ae7145






</td>
</tr>
<table>


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
        _showSnackBar('ContainerNeo pressed!');
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
img_neo
</td>

</tr>

<tr>

<td>

```dart
const NeoInputField(
                    hintText: 'Password',
                    width: 300,
                    obscureText: true,
                    bgcolor: Color(0xFFB0E0E6),
                    textStyle: TextStyle(color: Colors.black),
                  ),
```

</td>

<td>
img_input
</td>

</tr>

<tr>
<td>

```dart
NeoTextContainer(
    textWidget: Text(
        'Shadowy Text Container',
        style:
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
    width: 250,
    bgcolor: Color(0xFF3AC1FF),
),
```
</td>

<td>

img_text_input

</td>
</tr>

<tr>

<td>

```dart
NeoCircleIconButton(
    padding: const EdgeInsets.all(12),
    icon: const Icon(Icons.favorite,
        size: 40, color: Colors.black),
    backgroundColor: const Color(0xFFFF6B6B),
    offset: 3,
    onPressed: () {
        _showSnackBar("Favorite button pressed!");
        },
),
```

</td>

<td>
img_circle_icon
</td>

</tr>

<tr>

<td>

```dart
NeoSwitch(
    onChanged: (value, context) {
            setState(() {
                _switchValue = value;
                });
                _showSnackBar('$_switchValue');
            },
    defaultState: _switchValue,
    width: 110,
    height: 50,
    falseColor: Colors.grey,
    trueColor: const Color(0xFFFFA6F6),
    borderRadius: BorderRadius.circular(30),
    optionalShadowOffset: 4,
    animationDuration: const Duration(milliseconds: 180),
),

```
</td>

<td>
img_switch
</td>

</tr>


<tr>

<td>

```dart
NeoSegmentedOptions(
    onOptionSelected: (index, context) {
        setState(() {
            _selectedSegment = index;
            });
    },
    width: 100,
    height: 50,
    borderThickness: 2,
    numberOfOptions: 3,
    selectedOption: _selectedSegment,
    activeColor: const Color(0xFFA8A6FF),
    optionWidgets: const [
        Text('Option 1',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Option 2',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Option 3',
            style: TextStyle(fontWeight: FontWeight.bold)),
    ],
),
```
</td>

<td>
img_segmented

</td>

</tr>

<tr>
<td>

```dart
NeoSlider(
    value: _sliderValue2,
    onChanged: (value) {
        setState(() {
            _sliderValue2 = value;
        });
    },
    min: 0.0,
    max: 100.0,
    trackColor: const Color(0xFFE0E0E0),
    activeTrackColor: const Color(0xFFFF6B6B),
    thumbColor: Colors.white,
    thumbInnerColor: const Color(0xFFFF6B6B),
    height: 20.0,
    thumbSize: 40.0,
    shadowOffset: 3.0,
    showValueIndicator: true,
),
```
</td>

<td>
img_slider
</td>

</tr>


<tr>

<td>

```dart
NeoLoadingIndicator(
    size: 64.0,
    color: Color(0xFFFF6B6B),
    duration: Duration(milliseconds: 500),
),
```
</td>

<td>
img_loading
</td>
</tr>

<tr>
<td>

```dart
NeoDialog(
    title: const Text(
        'NEO DIALOG',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    content: const Text(
        'This is a neobrutalist dialog example!',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
    ),
    backgroundColor: const Color(0xFFFF6B6B),
    buttons: (You can add a row of buttons here!
    ),
)
```

</td>

<td>

img_dialog

</td>

</tr>

<tr>
<td>

```dart
void _showToast() {
ToastNeoService.show(
    backgroundColor: Colors.limeAccent,
    hasButton: true,
    buttonMessage: 'View',
    icon: Icons.info,
    height: 100,
    borderRadius: 10,
    borderThickness: 2,
    borderChin: 4,
    shadowColor: Colors.black,
    context,
    'This is a toast!',
    );
  }

```
</td>

<td>
img_toast
</td>


</tr>

<tr>
<td>

```dart
NeoWindow95(
    title: 'Neobrutalist Window',
    titleBarColor: const Color(0xFF3AC1FF),
    width: 400,
    onClose: () {
        _showSnackBar('Window closed!');
    },
    child: const Padding(
    padding: EdgeInsets.all(16),
        child: Text(
            'This is a neobrutalist window component!',
            style: TextStyle(fontSize: 16),
        ),
    ),
),

```
</td>

<td>
img_window
</td>

</tr>




## Additional information

This package is published on  <a href="https://pub.dev/packages/neobrutalist_ui_elements">pub.dev!</a> 
