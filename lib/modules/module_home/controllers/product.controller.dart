import 'package:get/get.dart';
import 'package:loja/domain/models/product.model.dart';
import 'package:loja/domain/usecases/add_product_usecase.dart';
import 'package:loja/domain/usecases/delete_product_usecase.dart';
import 'package:loja/domain/usecases/get_products_usecase.dart';

class ProductController extends GetxController {
  final GetProductsUseCase _getProductsUseCase;
  final AddProductUseCase _addProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;

  ProductController(
    this._getProductsUseCase,
    this._addProductUseCase,
    this._deleteProductUseCase,
  );

  Rx<List<ProductModel?>> productsList = Rx<List<ProductModel?>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final products = await _getProductsUseCase();
      productsList.value = products;
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao buscar os produtos');
    }
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      await _addProductUseCase(product);
      Get.snackbar('Sucesso', 'Produto adicionado com sucesso');
      fetchProducts(); // Atualiza a lista de produtos
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao adicionar o produto');
    }
  }

  ProductModel createProduct(String name, String description) {
    return ProductModel(name: name, description: description, id: '');
  }

  void showSuccessSnackbar() {
    Get.snackbar('Sucesso', 'Produto adicionado com sucesso');
  }

  void showErrorSnackbar() {
    Get.snackbar('Erro', 'Falha ao adicionar o produto');
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _deleteProductUseCase(productId);
      Get.snackbar('Sucesso', 'Produto removido com sucesso');
      fetchProducts(); // Atualiza a lista de produtos
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao remover o produto');
    }
  }
}
