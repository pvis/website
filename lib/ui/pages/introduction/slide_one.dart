import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:website/controllers/slide_animation_controller.dart';
import 'package:website/ui/common/arc_clipper.dart';
import 'package:website/ui/common/responsive.dart';

class SlideOne extends GetView<SlideAnimationController> {
  Widget _backgroundWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var desktopPage = Responsive.isDesktop(context) && width > height;
    return desktopPage
        ? Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 80),
                    Container(
                      height: height - 80,
                      child: Image.asset(
                        'assets/background_1.png',
                        fit: BoxFit.fitWidth,
                        width: width,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container(
            child: Stack(
              children: [
                ClipPath(
                  clipper: ArcClipper(),
                  child: Container(
                      color: Color(0xffa3cfec),
                      width: width,
                      height: height * 0.75),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                    width: min(height * 0.8, width * 0.8),
                    height: height * 0.6,
                    // color: Colors.red,
                    child: Image.asset(
                      'assets/background_2.png',
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget _printPvisWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var desktopPage = Responsive.isDesktop(context) && width > height;
    return desktopPage
        ? Container(
            width: width / 2,
            // color: Colors.red,
            height: height,
            alignment: Alignment(0, -0.2),
            child: Container(
              width: width / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PVIS',
                    style: TextStyle(fontSize: 20 * width / 600),
                  ),
                  SizedBox(height: height / 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ': ',
                        style: TextStyle(
                          fontSize: 20 * width / 600,
                        ),
                      ),
                      Container(
                        width: width / 2.7,
                        child: Text(
                          'Infotainment Service System for Public Vehicle',
                          style: TextStyle(fontSize: 16 * width / 600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: width,
            alignment: Alignment(0, -0.5),
            child: Container(
              width: width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PVIS',
                    style: TextStyle(
                        fontSize: min<double>(120, 100 * width / 600)),
                  ),
                  SizedBox(height: height / 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ': ',
                        style: TextStyle(
                            fontSize: min<double>(25, 50 * width / 600)),
                      ),
                      Container(
                        width: width * 0.7,
                        child: Text(
                          'Infotainment Service System for Public Vehicle',
                          style: TextStyle(
                              fontSize: min<double>(25, 50 * width / 600)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundWidget(context),
        Obx(
          () => AnimatedOpacity(
            opacity: controller.curSlide == 0 && controller.visible ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: AnimatedPadding(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.only(
                    top: controller.curSlide == 0 && controller.visible
                        ? 0
                        : 50),
                child: _printPvisWidget(context)),
          ),
        ),
      ],
    );
  }
}
