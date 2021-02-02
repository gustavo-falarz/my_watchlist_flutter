import 'package:json_annotation/json_annotation.dart';

class UserModel {
  String id;
  String email;
  String status;

  UserModel({this.id, this.email, this.status});

  static UserModel fromJson(dynamic json) {
    UserModel user = UserModel(
      id: json['id'],
      email: json['email'],
      status: json['status'],
    );
    return user;
  }
}

enum Status {
  @JsonValue('pending')
  PENDING,

  @JsonValue('pending-reset')
  PENDING_RESET,

  @JsonValue('active')
  ACTIVE,
}
