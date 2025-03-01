

This is a flutter package that aims to create beautiful, customizable and reusable UI elements that use "Neo Brutalistic" design language. It contains easy to use elements for developing beautiful UI pages.

## Features

- Main container element with customizable animations and shapes.
- Input field with controller support.
- Text container with Neo Brutalistic shadow

## Usage

<table>

<tr>

<td>

```dart
Container_Neo(
  animate: true,
  padding: const EdgeInsets.all(10),
  defaultPaddingBottom: 5,
  defaultPaddingRight: 5,
  bgcolor: const Color.fromARGB(255, 251, 209, 70),
  borderRadius: 3,
  onPressed: () {
    print('Container_Neo pressed');
  },
  onLongPressed: () {
    print('Container_Neo long pressed');
  },
  child: const Text('Neo Container',
      style: TextStyle(fontSize: 20),),
),



```
</td>

<td>
<img src="https://raw.githubusercontent.com/M3R3K/neobrutalist_ui_elements/refs/heads/main/demo.gif" alt="" width ="250" height = "500">



</td>
</tr>


## Additional information

I will be adding some more basic elements such as Cards, Search Bars and Dropdown, in the near future. <br>
This package is published on  <a href="https://pub.dev/packages/neobrutalist_ui_elements">pub.dev!</a> 
