import 'package:flutter/material.dart';
import 'package:neobrutalist_ui_elements/neobrutalist_ui_elements.dart';

// ignore: public_member_api_docs
class ShowcasePage extends StatefulWidget {
  // ignore: public_member_api_docs
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  double _sliderValue = 50.0;
  double _sliderValue2 = 25.0;
  double _sliderValue3 = 75.0;
  double _sliderValue4 = 60.0;
  bool _switchValue = false;
  int _selectedSegment = 0;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showToast() {
    NeoToastService.show(
      context,
      'This is a neobrutalist toast!',
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => NeoDialog(
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
        buttons: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeoContainer(
              bgcolor: Colors.grey,
              animate: true,
              onPressed: () => Navigator.of(context).pop(),
              borderRadius: 4,
              offset: 2,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Cancel', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(width: 16),
            NeoContainer(
              bgcolor: Colors.green,
              animate: true,
              onPressed: () => Navigator.of(context).pop(),
              borderRadius: 4,
              offset: 2,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('OK', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
/*       appBar: AppBar(
        elevation: 10,
        title: const Text(
          'Neobrutalist UI Elements',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ), */
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // ContainerNeo
            _buildSection(
              title: 'Container',
              child: Column(
                children: [
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
                  const SizedBox(height: 16),
                  const NeoContainer(
                    offset: 4,
                    animate: false,
                    padding: EdgeInsets.all(16),
                    bgcolor: Color(0xFF6C5CE7),
                    borderRadius: 12,
                    child: Text(
                      'Static Neo Container',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // InputField
            _buildSection(
              title: 'InputField',
              child: Column(
                children: [
                  NeoInputField(
                    hintText: 'Enter your email',
                    width: 300,
                    obscureText: false,
                    bgcolor: const Color(0xFFE0E0E0),
                    keyboardType: TextInputType.emailAddress,
                    controller: _textController,
                    onChanged: (value) {
                      debugPrint('Input changed: $value');
                    },
                  ),
                  const SizedBox(height: 16),
                  const NeoInputField(
                    hintText: 'Password',
                    width: 300,
                    obscureText: true,
                    bgcolor: Color(0xFFB0E0E6),
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // TextContainer
            _buildSection(
              title: 'TextContainer',
              child: const Column(
                children: [
                  NeoTextContainer(
                    textWidget: Text(
                      'Shadowy Text Container',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    width: 250,
                    bgcolor: Color(0xFF3AC1FF),
                  ),
                  SizedBox(height: 16),
                  NeoTextContainer(
                    textWidget: Text(
                      'Another Text Container',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    width: 220,
                    bgcolor: Color(0xFFFF6B6B),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // NeoCircleIconButton
            _buildSection(
              title: 'CircleIconButton',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeoCircleIconButton(
                    padding: const EdgeInsets.all(12),
                    icon: const Icon(Icons.add, size: 40, color: Colors.black),
                    backgroundColor: const Color(0xFF3AC1FF),
                    offset: 4,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Add button pressed!'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 24),
                  NeoCircleIconButton(
                    padding: const EdgeInsets.all(12),
                    icon: const Icon(Icons.favorite,
                        size: 40, color: Colors.black),
                    backgroundColor: const Color(0xFFFF6B6B),
                    offset: 3,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Favorite button pressed!'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 24),
                  NeoCircleIconButton(
                    padding: const EdgeInsets.all(12),
                    icon: const Icon(Icons.settings,
                        size: 40, color: Colors.black),
                    backgroundColor: const Color(0xFF4ECDC4),
                    offset: 4,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Settings button pressed!'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // NeoSwitch
            _buildSection(
              title: 'Switch',
              child: Column(
                children: [
                  NeoSwitch(
                    onChanged: (value, context) {
                      setState(() {
                        _switchValue = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Switch: $value'),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
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
                  const SizedBox(height: 16),
                  Text(
                    'Switch is: ${_switchValue ? "ON" : "OFF"}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // NeoSegmentedOptions
            _buildSection(
              title: 'SegmentedOptions',
              child: Column(
                children: [
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
                  const SizedBox(height: 16),
                  Text(
                    'Selected: Option ${_selectedSegment + 1}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // NeoSlider
            _buildSection(
              title: 'Slider',
              child: Column(
                children: [
                  // Default slider
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: NeoSlider(
                          value: _sliderValue,
                          onChanged: (value) {
                            setState(() {
                              _sliderValue = value;
                            });
                          },
                          min: 0.0,
                          max: 100.0,
                          trackColor: const Color(0xFFE0E0E0),
                          activeTrackColor: const Color(0xFF4CAF50),
                          thumbColor: Colors.white,
                          height: 24.0,
                          thumbSize: 32.0,
                          shadowOffset: 2.0,
                          showValueIndicator: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Default: ${_sliderValue.toStringAsFixed(1)}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Red slider with larger thumb
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: NeoSlider(
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
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Red with inner thumb: ${_sliderValue2.toStringAsFixed(1)}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Blue slider with divisions
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: NeoSlider(
                          value: _sliderValue3,
                          onChanged: (value) {
                            setState(() {
                              _sliderValue3 = value;
                            });
                          },
                          min: 0.0,
                          max: 100.0,
                          trackColor: const Color(0xFFE0E0E0),
                          activeTrackColor: const Color(0xFF3AC1FF),
                          thumbColor: Colors.white,
                          height: 28.0,
                          thumbSize: 36.0,
                          shadowOffset: 2.5,
                          divisions: 10,
                          showValueIndicator: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Blue with 10 divisions: ${_sliderValue3.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Purple slider without value indicator
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: NeoSlider(
                          value: _sliderValue4,
                          onChanged: (value) {
                            setState(() {
                              _sliderValue4 = value;
                            });
                          },
                          min: 0.0,
                          max: 100.0,
                          trackColor: const Color(0xFFE0E0E0),
                          activeTrackColor: const Color(0xFF6C5CE7),
                          thumbColor: Colors.white,
                          height: 22.0,
                          thumbSize: 30.0,
                          shadowOffset: 2.0,
                          showValueIndicator: false,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Purple without indicator: ${_sliderValue4.toStringAsFixed(1)}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Yellow slider with custom range
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: NeoSlider(
                          value: 30.0,
                          onChanged: (value) {},
                          min: 0.0,
                          max: 50.0,
                          trackColor: const Color(0xFFE0E0E0),
                          activeTrackColor: const Color(0xFFFFD93D),
                          thumbColor: Colors.white,
                          height: 26.0,
                          thumbSize: 34.0,
                          shadowOffset: 3.0,
                          showValueIndicator: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Yellow (0-50 range, static)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // NeoLoadingIndicator
            _buildSection(
              title: 'LoadingIndicator',
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeoLoadingIndicator(
                        size: 48.0,
                        color: Color(0xFF4CAF50),
                      ),
                      SizedBox(width: 24),
                      NeoLoadingIndicator(
                        size: 64.0,
                        color: Color(0xFFFF6B6B),
                        duration: Duration(milliseconds: 500),
                      ),
                      SizedBox(width: 24),
                      NeoLoadingIndicator(
                        size: 40.0,
                        color: Color(0xFF4ECDC4),
                        strokeWidth: 3.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  NeoLoadingIndicator(
                    size: 56.0,
                    color: Color(0xFFFFD93D),
                    shadowOffset: 3.0,
                  ),
                  SizedBox(height: 16),
                  NeoLoadingIndicator(
                    size: 48.0,
                    color: Color(0xFF6C5CE7),
                    borderRadius: 8.0,
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // NeoDialog
            _buildSection(
              title: 'Dialog',
              child: NeoContainer(
                bgcolor: const Color(0xFFFF6B6B),
                animate: true,
                onPressed: () => _showDialog(),
                borderRadius: 8,
                offset: 3,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    'Open Dialog',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            const Divider(height: 1),

            // NeoToast
            _buildSection(
              title: 'Toast',
              child: NeoContainer(
                bgcolor: const Color(0xFF00FF90),
                animate: true,
                onPressed: () => _showToast(),
                borderRadius: 8,
                offset: 3,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    'Show Toast',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const Divider(height: 1),

            // NeoWindow
            _buildSection(
              title: 'Window',
              child: Center(
                child: NeoWindow95(
                  title: 'Neobrutalist Window',
                  titleBarColor: const Color(0xFF3AC1FF),
                  width: 400,
                  onClose: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Window closed!'),
                        duration: Duration(milliseconds: 1500),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'This is a neobrutalist window component!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
