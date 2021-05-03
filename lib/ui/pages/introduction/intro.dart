import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/slide_animation_controller.dart';
import 'package:website/ui/pages/introduction/page_four.dart';
import 'package:website/ui/pages/introduction/slide_one.dart';
import 'package:website/ui/pages/introduction/slide_three.dart';
import 'package:website/ui/pages/introduction/slide_two.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final ScrollController _controller = ScrollController();
  final _aController = Get.put(SlideAnimationController());
  Timer? _timer;
  double _dragStart = 0;
  double _dragEnd = 0;
  double _height = 0;
  bool _doingAnimation = false;

  @override
  void initState() {
    super.initState();
    _aController.addSlideChangeListener(() {
      _controller.animateTo(_aController.curSlide * _height,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void startAnimation(bool isDown) {
    var _cur = _aController.curSlide;
    if (isDown && _cur < 3) {
      _cur++;
      _aController.setCurSlide(_cur);
    } else if (!isDown && _cur > 0) {
      _cur--;
      _aController.setCurSlide(_cur);
      _controller.animateTo(_cur * _height,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _height = _height < 600 ? 600 : _height;
    var _cur = _aController.curSlide;
    if (_cur != 0) {
      if (_timer != null && _timer!.isActive) _timer!.cancel();
      _timer = Timer(Duration(milliseconds: 100),
          () => _controller.jumpTo(_cur * _height));
    }

    return Scaffold(
      body: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent && !_doingAnimation) {
            _doingAnimation = true;
            Timer(Duration(milliseconds: 500), () => _doingAnimation = false);
            if (pointerSignal.scrollDelta.dy > 0) {
              startAnimation(true);
            } else {
              startAnimation(false);
            }
          }
        },
        child: GestureDetector(
          onVerticalDragDown: (details) {
            _dragStart = details.localPosition.dy;
            _dragEnd = details.localPosition.dy;
          },
          onVerticalDragUpdate: (details) {
            _dragEnd = details.localPosition.dy;
          },
          onVerticalDragEnd: (details) {
            if ((_dragEnd - _dragStart).abs() > 100) {
              if (_dragStart > _dragEnd) {
                startAnimation(true);
              } else {
                startAnimation(false);
              }
            }
          },
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: _height,
                    width: double.infinity,
                    child: SlideOne(),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: _height,
                    width: double.infinity,
                    child: SlideTwo(),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: _height,
                    width: double.infinity,
                    child: SlideThree(),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: _height,
                    width: double.infinity,
                    child: SlideFour(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
