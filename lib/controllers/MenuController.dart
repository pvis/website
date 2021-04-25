import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems =>
      ['Introduction', 'IEC/TC 100', 'Meeting-Log', 'Contribution'];
  List<VoidCallback> get callback => [
        () => setMenuIndex(0),
        () async {
          const _url =
              'https://www.iec.ch/dyn/www/f?p=103:7:0::::FSP_ORG_ID,FSP_LANG_ID:1297,25';
          await canLaunch(_url)
              ? await launch(_url)
              : throw 'Could not launch $_url';
        },
        () => setMenuIndex(2),
        () => setMenuIndex(3),
      ];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed('/introduction');
        break;
      case 2:
        Get.toNamed('/meetinglog');
        break;
      case 3:
        Get.toNamed('/contribution');
        break;
      default:
        Get.toNamed('/');
    }
  }
}
