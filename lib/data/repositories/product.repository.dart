import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:loja/domain/models/product.model.dart';
import 'package:loja/domain/repositories/product_repository.interface.dart';

class ProductRepository implements ProductRepositoryInterface {
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');
  final Dio _dio = Dio();

  Future<List<ProductModel>> getProductsFireBase() async {
    try {
      final snapshot = await _productsCollection.get();
      final products =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } catch (e) {
      throw Exception('Falha ao buscar os produtos');
    }
  }

  Future<void> addProductFireBase(ProductModel? product) async {
    try {
      await _productsCollection.add(product?.toJson());
    } catch (e) {
      throw Exception('Falha ao adicionar o produto');
    }
  }

  Future<void> deleteProductFireBase(String productId) async {
    try {
      await _productsCollection.doc(productId).delete();
    } catch (e) {
      throw Exception('Falha ao remover o produto');
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get('URL_DA_API/products');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final products =
            data.map((json) => ProductModel.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Falha ao buscar os produtos');
      }
    } catch (e) {
      throw Exception('Falha ao buscar os produtos');
    }
  }

  @override
  Future<void> addProduct(ProductModel? product) async {
    try {
      final response =
          await _dio.post('URL_DA_API/products', data: product?.toJson());

      if (response.statusCode != 200) {
        throw Exception('Falha ao adicionar o produto');
      }
    } catch (e) {
      throw Exception('Falha ao adicionar o produto');
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    try {
      final response = await _dio.delete('URL_DA_API/products/$productId');

      if (response.statusCode != 200) {
        throw Exception('Falha ao remover o produto');
      }
    } catch (e) {
      throw Exception('Falha ao remover o produto');
    }
  }
}
