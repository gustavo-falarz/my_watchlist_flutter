class ResultModel {
  bool status;
  String message;

  ResultModel({this.status, this.message});

  static ResultModel fromJson(dynamic json) {
    ResultModel result = ResultModel(
      status: json['status'],
      message: json['message'],
    );
    return result;
  }
}
