import 'package:finel_project_getx/app_pages.dart';
import 'package:finel_project_getx/app_route.dart';
import 'package:finel_project_getx/controllers/bindings.dart';
import 'package:finel_project_getx/controllers/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // DataBaseBinding().dependencies();
  Get.lazyPut(()=>DataBaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      initialRoute: Routes.Contacts,
      getPages: Pages.route,

    );
  }
}

