import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/ui/pages/introduction/introduction.dart';
import 'package:website/ui/header.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (Get.currentRoute == '/introduction') IntroductionPage(),
          if (Get.currentRoute == '/meetinglog') IntroductionPage(),
          if (Get.currentRoute == '/contribution') IntroductionPage(),
          Header(),
        ],
      ),
    );
  }
}
