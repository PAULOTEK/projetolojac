import 'package:loja/domain/models/product.model.dart';

abstract class ProductRepositoryInterface {
  Future<List<ProductModel?>> getProducts();
  Future<void> addProduct(ProductModel? product);
  Future<void> deleteProduct(String productId);
}
