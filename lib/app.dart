import 'package:flutter/material.dart';
import 'package:flutter_image_generator/presentation/provider/image_provider.dart';
import 'package:flutter_image_generator/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class FlutterImageGenerator extends StatefulWidget {
  const FlutterImageGenerator({super.key});

  @override
  State<FlutterImageGenerator> createState() => _FlutterImageGeneratorState();
}

class _FlutterImageGeneratorState extends State<FlutterImageGenerator> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageGeneratingProvider(),
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
