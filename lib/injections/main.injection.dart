// injection.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:loja/data/repositories/authetication.repository.dart';
import 'package:loja/data/repositories/product.repository.dart';
import 'package:loja/domain/repositories/auth_repository.interface.dart';
import 'package:loja/domain/repositories/product_repository.interface.dart';
import 'package:loja/domain/usecases/add_product_usecase.dart';
import 'package:loja/domain/usecases/delete_product_usecase.dart';
import 'package:loja/domain/usecases/get_products_usecase.dart';
import 'package:loja/domain/usecases/sign_in_usecase.dart';
import 'package:loja/domain/usecases/sign_out_usecase.dart';
import 'package:loja/modules/module_home/controllers/product.controller.dart';
import 'package:loja/modules/module_login/controllers/auth.controller.dart';

class MainInjection {
  static Future<void> init() async {
    await Firebase.initializeApp();

    final AuthRepositoryInterface authRepository = AuthenticationRepository();
    final ProductRepositoryInterface productRepository = ProductRepository();

    final SignInUseCase signInUseCase = SignInUseCase(authRepository);
    final SignOutUseCase signOutUseCase = SignOutUseCase(authRepository);
    final AddProductUseCase addProductUseCase =
        AddProductUseCase(productRepository);
    final DeleteProductUseCase deleteProductUseCase =
        DeleteProductUseCase(productRepository);

    final GetProductsUseCase getProductsUseCase =
        GetProductsUseCase(productRepository);

    final AuthController authController =
        AuthController(signInUseCase, signOutUseCase);

    final ProductController productController = ProductController(
      getProductsUseCase,
      addProductUseCase,
      deleteProductUseCase,
    );

    Get.put<AuthController>(authController);
    Get.put<ProductController>(productController);
  }
}
