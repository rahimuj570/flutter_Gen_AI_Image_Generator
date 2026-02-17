import 'package:flutter/material.dart';
import 'package:flutter_image_generator/presentation/provider/image_provider.dart';
import 'package:flutter_image_generator/presentation/widgets/image_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _promptTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Generator"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<ImageGeneratingProvider>(
          builder: (context, provider, child) => SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                SizedBox(height: 30),
                TextField(
                  controller: _promptTEC,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your promt here ...',
                  ),
                ),
                Visibility(
                  visible: provider.getIsGenerating == false,
                  replacement: CircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: () => provider.generateImage(_promptTEC.text),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Generate'),
                  ),
                ),
                SizedBox(height: 30),
                ImageWidget(provider: provider),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
