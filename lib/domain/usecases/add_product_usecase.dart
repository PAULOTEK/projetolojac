import 'package:loja/domain/models/product.model.dart';
import 'package:loja/domain/repositories/product_repository.interface.dart';

class AddProductUseCase {
  final ProductRepositoryInterface _productRepository;

  AddProductUseCase(this._productRepository);

  Future<void> call(ProductModel product) async {
    return _productRepository.addProduct(product);
  }
}
