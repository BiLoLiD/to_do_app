import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:to_do_app/page/auth/sign_in/sign_in_binding.dart';
import 'package:to_do_app/page/auth/sign_in/sign_in_view.dart';
import 'package:to_do_app/page/auth/sign_up/sign_up_binding.dart';
import 'package:to_do_app/page/auth/sign_up/sing_up_view.dart';
import 'package:to_do_app/page/main/main_bindings.dart';
import 'package:to_do_app/page/main/main_view.dart';
import 'package:to_do_app/page/main/tasks/task_binding.dart';
import 'package:to_do_app/page/main/tasks/task_list/task_list_binding.dart';
import 'package:to_do_app/page/main/tasks/task_list/task_list_view.dart';
import 'package:to_do_app/page/main/tasks/task_view.dart';
import 'package:to_do_app/util/app_routes.dart';

class AppRouteUtils {
  static final List<GetPage> pages = [
    ///Main
    GetPage(
        name: AppRouteNames.main,
        page: () => MainView(),
        binding: MainBinding()),

    ///Sign In
    GetPage(
        name: AppRouteNames.signIn,
        page: () => SignInView(),
        binding: SignInBinding()),

    ///Sign Up
    GetPage(
        name: AppRouteNames.signUp,
        page: () => SignUpView(),
        binding: SignUpBinding()),

    GetPage(
        name: AppRouteNames.task,
        page: () => const TaskView(),
        binding: TaskBinding()),
    GetPage(
        name: AppRouteNames.taskListView,
        page: () => const TaskListView(
              isEdit: false,
            ),
        binding: TaskListBinding())
  ];
}

class AppConstants {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();
  static const argumentName = 'tasksListName';
  static const important = 'important';
  static const task = 'task';
}
