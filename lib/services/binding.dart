import 'package:get/get.dart';
import 'package:getx_2_method/controller/create_controller.dart';
import 'package:getx_2_method/controller/edit_controller.dart';
import 'package:getx_2_method/controller/home_controller.dart';


class ControllersBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
    Get.put<EditController>(EditController());
    Get.put<CreateController>(CreateController());
  }
}
