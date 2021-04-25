import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  Timer? _timer = null;
  double _dragStart = 0;
  double _dragEnd = 0;
  double _height = 0;
  int _cur = 0;
  bool _doingAnimation = false;

  startAnimation(bool isDown) {
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

    if (_cur != 0) {
      // print("^^");
      if (_timer != null && _timer!.isActive) _timer!.cancel();

      _timer = Timer(Duration(milliseconds: 100),
          () => _controller.jumpTo(_cur * _height));
    }

    //
    return Scaffold(
      body: Stack(
        children: [
          Listener(
            onPointerSignal: (pointerSignal) {
              if (pointerSignal is PointerScrollEvent && !_doingAnimation) {
                _doingAnimation = true;
                Timer(
                    Duration(milliseconds: 500), () => _doingAnimation = false);
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
                if (_dragStart > _dragEnd) {
                  startAnimation(true);
                } else {
                  startAnimation(false);
                }
              },
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: _height,
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
          Container(
            width: double.infinity,
            height: 70,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
