import 'dart:convert';

import 'package:flutter_image_generator/data/model/network_response_model.dart';
import 'package:http/http.dart';

class NetworkCallerService {
  static Future<NetworkResponseModel> postCall({
    required String url,
    required Map<String, String>? header,
    required Map<String, dynamic>? body,
  }) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: header,
        body: body != null ? jsonEncode(body) : null,
      );
      if (response.statusCode == 200) {
        return NetworkResponseModel(
          statusCode: 200,
          isSuccess: true,
          responseData: jsonDecode(response.body),
          errorMessage: null,
        );
      } else {
        return NetworkResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
          responseData: jsonDecode(response.body),
          errorMessage: 'Request Failed',
        );
      }
    } catch (e) {
      return NetworkResponseModel(
        statusCode: -1,
        isSuccess: false,
        responseData: null,
        errorMessage: 'Internal App Problem',
      );
    }
  }
}
