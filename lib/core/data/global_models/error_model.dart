class ErrorModel {
  final int ? statusCode;
  final String ? message;
  ErrorModel({this.statusCode, this.message});
  factory ErrorModel.fromHttp({required int statusCode, required String bodyMessage}) {
    return ErrorModel(statusCode: statusCode, message: bodyMessage);
  }
  factory ErrorModel.fromUnknown() {
    return ErrorModel(statusCode: 500, message: "Unknown Error");
  }
}