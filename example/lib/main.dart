import 'package:flutter/material.dart';

import 'package:neobrutalist_ui_elements/neobrutalist_ui_elements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UI Elements Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ContainerNeo(
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
                      style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(height: 20),
                InputField(
                  hintText: 'InputField',
                  obscureText: false,
                  controller: null,
                  bgcolor: const Color.fromARGB(255, 220, 215, 215),
                  onChanged: () {
                    print('InputField changed');
                  },
                ),
                const SizedBox(height: 20),
                const TextContainer(
                    text: 'Shadowy Container',
                    width: 150,
                    bgcolor: Color.fromARGB(255, 58, 193, 255))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
