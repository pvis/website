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
  ScrollController _controller = ScrollController();
  double _height = 0;
  double _cur = 0;
  bool _doingAnimation = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Hello world");
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent && !_doingAnimation) {
            _doingAnimation = true;
            Timer(Duration(milliseconds: 500), () => _doingAnimation = false);
            if (pointerSignal.scrollDelta.dy > 0) {
              if (_cur < 3 * _height) {
                _cur += _height;
                if (_cur % _height != 0) {
                  _cur += (_height - (_cur % _height));
                }
              }

              _controller.animateTo(_cur,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else {
              if (_cur >= _height) {
                _cur -= _height;
                if (_cur % _height != 0) {
                  _cur -= _cur % _height;
                }
              } else if (_cur > 0) _cur = 0;
              _controller.animateTo(_cur,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            }
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
    );
  }
}
