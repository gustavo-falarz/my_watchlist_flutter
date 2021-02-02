
class NewUserModel {
  String email;

  NewUserModel({this.email});

  static NewUserModel fromJson(dynamic json) {
    NewUserModel user = NewUserModel(
      email: json['email'],
    );
    return user;
  }

  Map<String, dynamic> toJson() => {'email': email};
}
