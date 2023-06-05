class UserModel {
  final String? id;
  final String? email;

  UserModel({this.id, this.email});

  static UserModel fromFirebaseUser(UserModel user) {
    return UserModel(
      id: user.id,
      email: user.email,
    );
  }
}
