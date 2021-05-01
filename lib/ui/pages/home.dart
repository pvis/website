import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/ui/components/route_appbar.dart';
import 'package:website/ui/pages/contribution/contribution.dart';
import 'package:website/ui/pages/introduction/introduction.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  Widget _appbarWidget() {
    return Container(
      child: Column(
        children: [
          RouteAppBar(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (Get.currentRoute == '/introduction') IntroductionPage(),
          if (Get.currentRoute == '/meetinglog') IntroductionPage(),
          if (Get.currentRoute == '/contribution') ContributionPage(),
          _appbarWidget(),
        ],
      ),
    );
  }
}
