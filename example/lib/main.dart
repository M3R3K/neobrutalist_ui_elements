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

  void _onSegmentedOptionSelected(int index, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Option $index selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //generating a list of text widgets for the NeoSegmentedOptions
    List<Widget> textWidgets = List.generate(
        3,
        (index) => Text(
              'Option $index',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ));

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
                  offset: 3,
                  animate: true,
                  padding: const EdgeInsets.all(10),
                  bgcolor: const Color.fromARGB(255, 251, 209, 70),
                  borderRadius: 3,
                  onPressed: () {
                    debugPrint('Container_Neo pressed');
                  },
                  child: const Text('Neo Container',
                      style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(height: 20),
                InputField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Hint",
                  hintStyle: TextStyle(color: Colors.blueAccent),
                  textStyle: TextStyle(color: Colors.amber),
                  width: 250,
                  obscureText: false,
                  bgcolor: Color.fromARGB(255, 220, 215, 215),
                ),
                const SizedBox(height: 20),
                const TextContainer(
                    textWidget: Text("Shadowy Text Container",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    width: 150,
                    bgcolor: Color.fromARGB(255, 58, 193, 255)),
                const SizedBox(height: 20),
                NeoCircleIconButton(
                    padding: const EdgeInsets.all(6),
                    icon: const Icon(
                      Icons.add,
                      size: 60,
                      color: Colors.black,
                    ),
                    backgroundColor: const Color.fromARGB(255, 58, 193, 255),
                    offset: 4,
                    onPressed: () {
                      debugPrint("Button pressed");
                    }),
                const SizedBox(
                  height: 20,
                ),
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
                NeoSegmentedOptions(
                  onOptionSelected: _onSegmentedOptionSelected,
                  width: 100,
                  height: 50,
                  borderThickness: 2,
                  numberOfOptions: 3,
                  selectedOption: 1,
                  activeColor: const Color.fromRGBO(168, 166, 255, 1),
                  optionWidgets: textWidgets,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
