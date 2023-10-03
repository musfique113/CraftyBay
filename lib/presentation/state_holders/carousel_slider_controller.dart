import 'package:CraftyBay/data/models/carousel_slider_data_model.dart';
import 'package:CraftyBay/data/services/network_caller.dart';
import 'package:CraftyBay/data/services/network_response.dart';
import 'package:CraftyBay/data/utils/urls.dart';
import 'package:get/get.dart';

class CarouselSlidersController extends GetxController {
  bool _getCarouselSlidersInProgress = false;
  CarouselSliderDataModel _carouselSliderDataModel = CarouselSliderDataModel();
  String _message = '';

  bool get getCarouselSlidersInProgress => _getCarouselSlidersInProgress;

  CarouselSliderDataModel get carouselSliderDataModel =>
      _carouselSliderDataModel;

  String get message => _message;

  Future<bool> getCarouselSliders() async {
    _getCarouselSlidersInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getCarouselSliders);
    _getCarouselSlidersInProgress = false;

    if (response.isSuccess) {
      _carouselSliderDataModel =
          CarouselSliderDataModel.fromJson(response.body ?? {});
      update();
      return true;
    } else {
      return false;
    }
  }
}
