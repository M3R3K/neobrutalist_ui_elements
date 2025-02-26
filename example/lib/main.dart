import 'package:flutter/material.dart';

import 'package:neobrutalist_ui_elements/neobrutalist_ui_elements.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _onSwitchChanged(bool value, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Switch changed to: $value'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  padding: EdgeInsets.all(6),
                  width: 250,
                  hintText: 'Please enter your name',
                  obscureText: false,
                  controller: null,
                  bgcolor: const Color.fromARGB(255, 220, 215, 215),
                  onChanged: () {
                    print('InputField changed');
                  },
                ),
                const SizedBox(height: 20),
                const TextContainer(
                    textWidget: Text("Shadowy Text Container",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    width: 150,
                    bgcolor: Color.fromARGB(255, 58, 193, 255)),
                const SizedBox(height: 20),
                NeoCircleIconButon(
                  padding: const EdgeInsets.all(6),
                  onPressed: () => debugPrint("Button pressed!"),
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.black,
                  ),
                  backgroundColor: const Color.fromARGB(255, 58, 193, 255),
                  offsetA: 4,
                  offsetB: 4,
                ),
                const SizedBox(height: 20),
                NeoSwitch(
                  onChanged: _onSwitchChanged,
                  defaultState: true,
                  width: 110,
                  height: 50,
                  falseColor: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                  trueColor: const Color.fromRGBO(255, 166, 246, 1),
                  optionalShadowOffset: 4,
                  animationDuration: const Duration(milliseconds: 180),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
