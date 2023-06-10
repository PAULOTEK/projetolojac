import 'package:get/get.dart';
import 'package:loja/domain/models/user.model.dart';
import 'package:loja/domain/usecases/sign_in_usecase.dart';
import 'package:loja/domain/usecases/sign_out_usecase.dart';

class AuthController extends GetxController {
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthController(this._signInUseCase, this._signOutUseCase);

  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await _signInUseCase(email, password);
      currentUser.value = user;
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao fazer login');
    }
  }

  Future<void> signOut(String token) async {
    try {
      await _signOutUseCase(token);
      currentUser.value = null;
      Get.offAllNamed('/');
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao fazer logout');
    }
  }
}
