import 'package:get/get.dart';
import 'package:to_do_app/page/auth/sign_up/sign_up_controller.dart';
import 'package:to_do_app/page/main/main_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
