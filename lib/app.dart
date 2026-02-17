import 'package:flutter/material.dart';
import 'package:flutter_image_generator/presentation/screens/home_screen.dart';

class FlutterImageGenerator extends StatefulWidget {
  const FlutterImageGenerator({super.key});

  @override
  State<FlutterImageGenerator> createState() => _FlutterImageGeneratorState();
}

class _FlutterImageGeneratorState extends State<FlutterImageGenerator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
