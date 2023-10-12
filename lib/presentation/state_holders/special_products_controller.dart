import 'package:CraftyBay/data/models/products_model.dart';
import 'package:CraftyBay/data/services/network_caller.dart';
import 'package:CraftyBay/data/services/network_response.dart';
import 'package:CraftyBay/data/utils/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductsInProgress = false;
  ProductModel _specialProductModel = ProductModel();
  String _errorMessage = '';

  bool get getSpecialProductsInProgress => _getSpecialProductsInProgress;

  ProductModel get specialProductModel => _specialProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProducts() async {
    _getSpecialProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductsByRemarks('special'));
    _getSpecialProductsInProgress = false;
    if (response.isSuccess) {
      _specialProductModel = ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Special product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
