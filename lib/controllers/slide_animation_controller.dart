import 'package:get/get.dart';

class SlideAnimationController extends GetxController {
  final RxInt _curSlide = 0.obs;
  final RxBool _visible = false.obs;

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
