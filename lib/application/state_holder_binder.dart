import 'package:CraftyBay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainBottomNavController());
  }

}