

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
<img src="https://github.com/user-attachments/assets/df6c1879-b58e-41a6-982a-d698d195239f" alt="">

</td>
</tr>


## Additional information

I will be adding some more basic elements such as Cards, Search Bars and Dropdown, in the near future.
