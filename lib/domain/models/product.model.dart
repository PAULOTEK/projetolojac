import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? name;
  String? description;

  ProductModel({this.id, this.name, this.description});

  factory ProductModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}
