import 'package:firebase_auth/firebase_auth.dart';
import 'package:loja/domain/models/user.model.dart';
import 'package:loja/domain/repositories/auth_repository.interface.dart';

class AuthenticationRepository implements AuthRepositoryInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Aqui, você precisa converter o User do FirebaseAuth para o UserModel do seu domínio.
      UserModel? userModel = userCredential.user != null
          ? UserModel.fromFirebaseUser(userCredential.user! as UserModel)
          : null;
      return userModel;
    } catch (e) {
      throw Exception('Falha ao fazer login');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Falha ao fazer logout');
    }
  }
}
