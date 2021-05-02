import 'dart:async';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController get to => Get.find();
  RxInt _selectedIndex = 0.obs;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _eventBloc = MenuEventBloc();
  MenuEventBloc get eventBloc => _eventBloc;
  VoidCallback? toggleListener;

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
        () async {
          const _url = 'mailto://temp@gmail.com';
          await canLaunch(_url)
              ? await launch(_url)
              : throw 'Could not launch $_url';
        },
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

  @override
  void dispose() {
    super.dispose();
  }
}

class MenuEventBloc {
  final StreamController<MenuEvent> _eventSubject =
      StreamController<MenuEvent>();
  Stream<MenuEvent> get stream => _eventSubject.stream;
  Sink<MenuEvent> get sink => _eventSubject.sink;

  void dispose() {
    _eventSubject.close();
  }
}

enum MenuEvent { TOGGLE_APPBAR }
