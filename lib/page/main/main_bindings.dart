import 'package:get/instance_manager.dart';
import 'package:to_do_app/page/auth/sign_in/sign_in_controller.dart';
import 'package:to_do_app/page/auth/sign_up/sign_up_controller.dart';
import 'package:to_do_app/page/main/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
