import 'package:CraftyBay/presentation/state_holders/carousel_slider_controller.dart';
import 'package:CraftyBay/presentation/state_holders/category_list_controller.dart';
import 'package:CraftyBay/presentation/state_holders/email_verification_controller.dart';
import 'package:CraftyBay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:CraftyBay/presentation/state_holders/new_products_controller.dart';
import 'package:CraftyBay/presentation/state_holders/otp_verification_controller.dart';
import 'package:CraftyBay/presentation/state_holders/popular_products_controller.dart';
import 'package:CraftyBay/presentation/state_holders/special_products_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(CarouselSlidersController());
    Get.put(OtpVerificationController());
    Get.put(CategoryListController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put((NewProductController()));
  }
}
