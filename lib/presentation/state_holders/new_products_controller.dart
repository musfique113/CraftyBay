
import 'package:CraftyBay/data/models/products_model.dart';
import 'package:CraftyBay/data/services/network_caller.dart';
import 'package:CraftyBay/data/services/network_response.dart';
import 'package:CraftyBay/data/utils/urls.dart';
import 'package:get/get.dart';


class NewProductController extends GetxController {
  bool _getNewProductsInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';

  bool get getNewProductsInProgress => _getNewProductsInProgress;

  ProductModel get newProductModel => _newProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getPopularProducts() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getProductsByRemarks('new'));
    _getNewProductsInProgress = false;
    if (response.isSuccess) {
      _newProductModel = ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'New product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
