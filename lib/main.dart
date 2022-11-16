import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:to_do_app/page/auth/sign_in/sign_in_binding.dart';
import 'package:to_do_app/page/auth/sign_in/sign_in_view.dart';
import 'package:to_do_app/page/main/main_view.dart';
import 'package:to_do_app/src/auth/fire_auth_src.dart';
import 'package:to_do_app/util/app_consts.dart';
import 'package:to_do_app/util/app_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSetup.setup;
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => child!,
      child: GetMaterialApp(
        defaultTransition: Transition.native,
        scaffoldMessengerKey: AppConstants.messangerKey,
        useInheritedMediaQuery: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: DevicePreview.appBuilder,
        getPages: AppRouteUtils.pages,
        home: StreamBuilder<User?>(
          stream: FireAuth.auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return MainView();
              } else {
                return SignInView();
              }
            }
            return SignInView();
          },
        ),
        initialBinding: SignInBinding(),
      ),
    );
  }
}
