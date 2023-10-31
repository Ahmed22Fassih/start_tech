import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_task/routes/app_pages.dart';
import 'package:start_task/routes/app_routes.dart';
import 'package:start_task/services/auth_services.dart';
import 'package:start_task/shared/logger.dart';

import 'config/configReader.dart';
import 'package:get/get.dart';

import 'consts/themes.dart';

void main() async {
  Get.put(AuthService());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Start Tech',
          debugShowCheckedModeBanner: true,
          enableLog: true,
          logWriterCallback: Logger.write,
          theme: Themes.light,
          themeMode: ThemeMode.light,
          getPages: AppPages.routes,
          initialRoute: Routes.WELCOME,
        );
      },
    );
  }
}
