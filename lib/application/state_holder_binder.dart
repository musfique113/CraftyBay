import 'package:CraftyBay/presentation/state_holders/carousel_slider_controller.dart';
import 'package:CraftyBay/presentation/state_holders/email_verification_controller.dart';
import 'package:CraftyBay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(CarouselSlidersController());
  }
}
