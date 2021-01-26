import 'package:json_annotation/json_annotation.dart';

class User {
  String id;
  String email;
  String status;

  User({this.id, this.email, this.status});

  static User fromJson(dynamic json) {
    User user = User(
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
