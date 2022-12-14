import 'package:get/instance_manager.dart';
import 'package:to_do_app/page/main/tasks/task_controller.dart';
import 'package:to_do_app/page/main/tasks/task_list/task_list_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
    Get.lazyPut<TaskListController>(() => TaskListController());
  }
}
