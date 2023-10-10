
import 'package:CraftyBay/data/models/products_model.dart';
import 'package:CraftyBay/data/services/network_caller.dart';
import 'package:CraftyBay/data/services/network_response.dart';
import 'package:CraftyBay/data/utils/urls.dart';
import 'package:get/get.dart';


class PopularProductController extends GetxController {
  bool _getPopularProductsInProgress = false;
  ProductModel _popularProductModel = ProductModel();
  String _errorMessage = '';

  bool get getPopularProductsInProgress => _getPopularProductsInProgress;

  ProductModel get popularProductModel => _popularProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getPopularProducts() async {
    _getPopularProductsInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getProductsByRemarks('popular'));
    _getPopularProductsInProgress = false;
    if (response.isSuccess) {
      _popularProductModel = ProductModel.fromJson(response.body ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
