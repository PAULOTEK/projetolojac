import 'package:loja/domain/models/user.model.dart';
import 'package:loja/domain/repositories/auth_repository.interface.dart';

class SignInUseCase {
  final AuthRepositoryInterface _authRepository;

  SignInUseCase(this._authRepository);

  Future<UserModel?> call(String email, String password) async {
    return _authRepository.signInWithEmailAndPassword(email, password);
  }
}
