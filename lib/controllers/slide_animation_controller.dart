import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideAnimationController extends GetxController {
  final RxInt _curSlide = 0.obs;
  final RxBool _visible = false.obs;
  final RxInt _idx = 0.obs;

  int get idx => _idx.value;
  void setIdx(int idx) {
    _idx(idx);
  }

  final List<String> images = [
    'assets/personal_infotainment.png',
    'assets/public_infotainment.png',
  ];

  final List<Color> colors = [
    Colors.yellow[300]!,
    Colors.blue[300]!,
    Colors.grey[300]!,
    Colors.green[300]!
  ];

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 700), () {
      _visible(true);
    });
  }

  int get curSlide => _curSlide.value;
  bool get visible => _visible.value;
  void setCurSlide(int _cur) {
    _visible(false);
    Future.delayed(Duration(milliseconds: 300), () {
      _visible(true);
      print('cur : $_cur / visible : $_visible');
    });
    _curSlide(_cur);
    _slideChangeListener!();
  }

  VoidCallback? _slideChangeListener;
  void addSlideChangeListener(VoidCallback slideChangeListener) {
    _slideChangeListener = slideChangeListener;
  }
}
