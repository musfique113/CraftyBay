
import 'package:CraftyBay/data/models/models_data/products_model_data.dart';
// Model class for Popular product , New product, special product
class ProductModel {
  String? msg;
  List<Product>? data;

  ProductModel({this.msg, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
