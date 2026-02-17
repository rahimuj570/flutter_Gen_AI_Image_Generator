import 'package:flutter_image_generator/data/model/image_model.dart';
import 'package:flutter_image_generator/data/model/network_response_model.dart';
import 'package:flutter_image_generator/data/service/network_caller_service.dart';
import 'package:flutter_image_generator/secrets.dart';

class OpenApiService {
  static const String _baseUrl = 'https://api.openai.com/v1/images/generations';

  static Future<ImageModel?> generateImage(String prompt) async {
    try {
      NetworkResponseModel responseModel = await NetworkCallerService.postCall(
        url: _baseUrl,
        header: {
          "Content-type": "application/json",
          "Authorization": "Bearer ${Secrets.apiKey}",
        },
        body: {
          "model": "dall-e-2",
          "prompt": prompt,
          "n": 1,
          "size": "512x512",
        },
      );

      if (responseModel.isSuccess) {
        return ImageModel(
          url: responseModel.responseData['data'][0]['url'],
          prompt: prompt,
          createdAt: DateTime.fromMillisecondsSinceEpoch(
            responseModel.responseData['created'],
          ),
        );
      }
    } catch (e) {
      throw e.toString();
    }
    return null;
  }
}
