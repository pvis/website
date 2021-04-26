import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:website/ui/pages/introduction/first_frame.dart';

class IntroductionPage extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  Timer? _timer;
  double _dragStart = 0;
  double _dragEnd = 0;
  double _height = 0;
  int _cur = 0;
  bool _doingAnimation = false;

  void startAnimation(bool isDown) {
    if (isDown && _cur < 3) {
      _cur++;
      _controller.animateTo(_cur * _height,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else if (!isDown && _cur > 0) {
      _cur--;
      _controller.animateTo(_cur * _height,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _height = _height < 600 ? 600 : _height;

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
                    color: Colors.red,
                    height: _height,
                    width: double.infinity,
                    child: FirstFrame(),
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: _height,
                ),
                Container(
                  color: Colors.blue,
                  height: _height,
                ),
                Container(
                  color: Colors.black,
                  height: _height,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
