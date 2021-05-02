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
    'https://images.unsplash.com/photo-1546555648-fb7876c40c58?ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80',
    'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    'https://images.unsplash.com/photo-1560185008-186576e0f1e2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    'https://images.unsplash.com/photo-1560448204-61dc36dc98c8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
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
  }
}
