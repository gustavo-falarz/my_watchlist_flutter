class UserDTO {
  String email;
  String password;

  UserDTO({this.email, this.password});

  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password};
}
