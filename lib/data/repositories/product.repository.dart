import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja/domain/models/product.model.dart';
import 'package:loja/domain/repositories/product_repository.interface.dart';

class ProductRepository implements ProductRepositoryInterface {
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final snapshot = await _productsCollection.get();
      final products =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } catch (e) {
      throw Exception('Falha ao buscar os produtos');
    }
  }

  @override
  Future<void> addProduct(ProductModel? product) async {
    try {
      await _productsCollection.add(product?.toJson());
    } catch (e) {
      throw Exception('Falha ao adicionar o produto');
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    try {
      await _productsCollection.doc(productId).delete();
    } catch (e) {
      throw Exception('Falha ao remover o produto');
    }
  }
}
