import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/constants/mobile_page.dart';
import 'package:website/constants/web_page.dart';
import 'package:website/controllers/slide_animation_controller.dart';
import 'package:website/ui/common/responsive.dart';
import 'dart:math';

import 'package:website/ui/pages/introduction/page_indicator.dart';

class SlideThree extends GetView<SlideAnimationController> {
  final _pageController = PageController();
  final _colorController = PageController();
  final _title = <String>[
    'Personal Infotainment Services',
    'Public Infotainment Services'
  ];
  @override
  Widget build(BuildContext context) {
    var mobilePage = Responsive.isMobile(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            //background
            Align(
              alignment: Alignment.topLeft,
              child: Transform.rotate(
                angle: pi,
                child: Container(
                  height: mobilePage
                      ? height * MobilePage.backgroundColorHeightFactor
                      : height * WebPage.backgroundColorHeightFactor,
                  width: mobilePage
                      ? height * MobilePage.backgroundColorWidthFactor
                      : width * WebPage.backgroundColorWidthFactor,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: _colorController,
                    children: controller.colors
                        .map(
                          (e) => Container(
                            color: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            //image
            Align(
              alignment: mobilePage ? MobilePage.imageAlign : Alignment(0, 0.3),
              child: Container(
                height: mobilePage
                    ? height * MobilePage.imageHeightFactor
                    : height * WebPage.imageWidthFactor,
                width: mobilePage
                    ? width * MobilePage.imageWidthFactor
                    : width * WebPage.imageWidthFactor,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  children: controller.images
                      .map(
                        (e) => Container(
                          child: Image.network(
                            e,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Obx(
              () => Align(
                alignment: mobilePage
                    ? MobilePage.headTextAlign
                    : Alignment(-0.8, -0.7),
                child: Container(
                  child: Text(
                    _title[controller.idx],
                    style: TextStyle(
                      fontSize: mobilePage
                          ? MobilePage.headTextFontSize
                          : WebPage.headTextFontSize,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment:
            //       mobilePage ? MobilePage.subTextAlign : WebPage.subTextAlign,
            //   child: Container(
            //     height: 100.0,
            //     width:
            //         mobilePage ? MobilePage.subTextContainerWidth : width * 0.5,
            //     child: Text(
            //       'Many services.',
            //       style: TextStyle(
            //         fontSize: 25.0,
            //         wordSpacing: 3.0,
            //         fontWeight: FontWeight.w300,
            //       ),
            //     ),
            //   ),
            // ),
            Align(
              alignment: mobilePage ? MobilePage.imageAlign : Alignment(0, 0.5),
              child: Container(
                width: mobilePage
                    ? width * MobilePage.imageWidthFactor
                    : max(width * WebPage.imageWidthFactor, 400),
                alignment: Alignment(1, 0.9),
                child: PageIndicator(
                  prevButtonTap: () {
                    var index = controller.idx - 1;
                    if (index < 0) {
                      index = 0;
                    }
                    controller.setIdx(index);
                    _pageController.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                    _colorController.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  },
                  nextButtonTap: () {
                    var index = controller.idx + 1;
                    if (index > 1) {
                      index = 1;
                    }
                    controller.setIdx(index);
                    _pageController.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                    _colorController.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
