class UserModel {
  final String? id;
  final String? email;
  final String? token;

  UserModel({this.id, this.email, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json['token'],
    );
  }
}
