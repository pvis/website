import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/menu_controller.dart';
import 'package:website/ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var home = HomePage(title: 'Home');
    Get.put(MenuController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/introduction',
      getPages: [
        GetPage(
          name: '/introduction',
          page: () => home,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/meetinglog',
          page: () => home,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/contribution',
          page: () => home,
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
