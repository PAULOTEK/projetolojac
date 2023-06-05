import 'package:loja/domain/repositories/product_repository.interface.dart';

class DeleteProductUseCase {
  final ProductRepositoryInterface _productRepository;

  DeleteProductUseCase(this._productRepository);

  Future<void> call(String productId) async {
    return _productRepository.deleteProduct(productId);
  }
}
