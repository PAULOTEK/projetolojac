import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loja/domain/models/user.model.dart';
import 'package:loja/domain/repositories/auth_repository.interface.dart';

class AuthenticationRepository implements AuthRepositoryInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Dio _dio = Dio();

  // Future<UserModel?> signInWithEmailAndPasswordFireBase(
  //     String email, String password) async {
  //   try {
  //     final userCredential = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // Aqui, você precisa converter o User do FirebaseAuth para o UserModel do seu domínio.
  //     UserModel? userModel = userCredential.user != null
  //         ? UserModel.fromFirebaseUser(userCredential.user! as UserModel)
  //         : null;
  //     return userModel;
  //   } catch (e) {
  //     throw Exception('Falha ao fazer login');
  //   }
  // }

  // Future<void> signOutFireBase() async {
  //   try {
  //     await _auth.signOut();
  //   } catch (e) {
  //     throw Exception('Falha ao fazer logout');
  //   }
  // }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await _dio.post(
        'URL_DA_API/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final token = response.data;
        return token;
      } else {
        throw Exception('Falha ao fazer login');
      }
    } catch (e) {
      throw Exception('Falha ao fazer login');
    }
  }

  @override
  Future<void> signOut(String token) async {
    try {
      final response = await _dio.post(
        'URL_DA_API/logout',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode != 200) {
        throw Exception('Falha ao fazer logout');
      }
    } catch (e) {
      throw Exception('Falha ao fazer logout');
    }
  }
}
