import 'package:flutter/material.dart';
import 'package:flutter_image_generator/data/model/image_model.dart';
import 'package:flutter_image_generator/data/service/open_api_service.dart';

class ImageGeneratingProvider extends ChangeNotifier {
  bool isGenerating = false;
  ImageModel? currentImage;
  String? errorMessage;
  bool get getIsGenerating => isGenerating;
  ImageModel? get getCurrentImage => currentImage;
  String? get getErrorMessage => errorMessage;

  Future<void> generateImage(String prompt) async {
    errorMessage = null;
    isGenerating = true;
    notifyListeners();
    currentImage = await OpenApiService.generateImage(prompt);
    if (currentImage == null) {
      errorMessage = "Could not generate the image";
    }
    isGenerating = false;
    notifyListeners();
  }
}
