import 'package:loja/domain/models/user.model.dart';

abstract class AuthRepositoryInterface {
  Future<UserModel?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
