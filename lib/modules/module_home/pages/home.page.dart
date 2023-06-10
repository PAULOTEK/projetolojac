import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja/domain/models/product.model.dart';
import 'package:loja/modules/module_home/controllers/product.controller.dart';
import 'package:loja/modules/module_login/controllers/auth.controller.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final ProductController _productController = Get.find<ProductController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Sair'),
            onPressed: () {
              final token = _authController.currentUser.value?.token;
              _authController.signOut(token!);
            },
          ),
          ElevatedButton(
            child: const Text('Adicionar Produto'),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  final TextEditingController nameController =
                      TextEditingController();
                  final TextEditingController descriptionController =
                      TextEditingController();

                  return AlertDialog(
                    title: const Text('Novo Produto'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(labelText: 'Nome'),
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration:
                              const InputDecoration(labelText: 'Descrição'),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        child: const Text('Adicionar'),
                        onPressed: () {
                          final name = nameController.text;
                          final description = descriptionController.text;
                          final product = ProductModel(
                              name: name, description: description, id: '');
                          _productController.addProduct(product);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Obx(
            () {
              final products = _productController.productsList.value;
              if (products.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = products[index];
                      return ListTile(
                        title: Text(product?.name ?? 'No name'),
                        subtitle:
                            Text(product?.description ?? 'No description'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            if (product?.id != null) {
                              _productController.deleteProduct(product!.id!);
                            }
                          },
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
