
import 'package:CraftyBay/data/models/category_list_model.dart';
import 'package:CraftyBay/data/services/network_caller.dart';
import 'package:CraftyBay/data/services/network_response.dart';
import 'package:CraftyBay/data/utils/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _getCategoryListInProgress = false;
  CategoryListModel _categoryListModel = CategoryListModel();
  String _message = '';

  bool get getCategoryListInProgress => _getCategoryListInProgress;

  CategoryListModel get categoryListModel =>
      _categoryListModel;

  String get message => _message;

  Future<bool> getCategoryList() async {
    _getCategoryListInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getCategories);
    _getCategoryListInProgress = false;

    if (response.isSuccess) {
      _categoryListModel =
          CategoryListModel.fromJson(response.body ?? {});
      update();
      return true;
    } else {
      _message = 'Category list data fetch failed!';
      return false;
    }
  }
}
