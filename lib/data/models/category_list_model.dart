import 'package:CraftyBay/data/models/models_data/category_list_model_data.dart';

class CategoryListModel {
  String? msg;
  List<CategoryListModelData>? data;

  CategoryListModel({this.msg, this.data});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CategoryListModelData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryListModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
