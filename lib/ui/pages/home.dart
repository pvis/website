import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/ui/components/route_appbar.dart';
import 'package:website/ui/pages/contribution/contribution.dart';
import 'package:website/ui/pages/introduction/intro.dart';
import 'package:website/ui/pages/meeting-log/meeting-log.dart';

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
          Column(
            children: [
              if (Get.currentRoute == '/introduction')
                Expanded(child: IntroPage()),
              if (Get.currentRoute == '/meetinglog')
                Expanded(child: MeetingLogPage()),
              if (Get.currentRoute == '/contribution')
                Expanded(child: ContributionPage()),
            ],
          ),

          // Padding(
          //   padding: EdgeInsets.only(
          //       top: Responsive.isDesktop(context) ? 80 : 60),
          //   child: IntroPage(),
          // ),

          _appbarWidget(),
        ],
      ),
    );
  }
}
