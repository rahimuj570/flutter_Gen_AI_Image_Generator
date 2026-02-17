class NetworkResponseModel {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;

  NetworkResponseModel({
    required this.statusCode,
    required this.isSuccess,
    required this.responseData,
    required this.errorMessage,
  });
}
