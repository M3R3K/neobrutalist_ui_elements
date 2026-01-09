import 'package:example/showcase_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ignore: public_member_api_docs
class MyApp extends StatefulWidget {
  // ignore: public_member_api_docs
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Neobrutalist UI Elements',
        home: ShowcasePage());
  }
}
