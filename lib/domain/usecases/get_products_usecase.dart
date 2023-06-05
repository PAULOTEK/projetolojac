import 'package:loja/domain/models/product.model.dart';
import 'package:loja/domain/repositories/product_repository.interface.dart';

class GetProductsUseCase {
  final ProductRepositoryInterface _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<List<ProductModel?>> call() async {
    try {
      final products = await _productRepository.getProducts();
      return products;
    } catch (e) {
      throw Exception('Falha ao buscar os produtos');
    }
  }
}
