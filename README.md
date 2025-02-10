

This is a flutter package that aims to create beautiful, customizable and reusable UI elements that use "Neo Brutalistic" design language. It contains easy to use elements for developing beautiful UI pages.

## Features

- Main container element with customizable animations and shapes.
- Input field with controller support.
- Text container with Neo Brutalistic shadow

## Usage


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

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
