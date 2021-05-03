import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';
import 'package:website/controllers/slide_animation_controller.dart';

class SlideFour extends GetView<SlideAnimationController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, ctis) {
        var width = min(ctis.maxWidth, ctis.maxHeight) * 0.9;

        return Column(
          children: [
            SizedBox(height: 80),
            Expanded(
              child: Center(
                child: Container(
                  width: width,
                  height: width,
                  child: Obx(
                    () => Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: AnimatedOpacity(
                                  opacity: controller.curSlide == 3 &&
                                          controller.visible
                                      ? 1
                                      : 0,
                                  duration: Duration(seconds: 1),
                                  child: Image.asset(
                                    'assets/website_icon.png',
                                    width: width * 0.33,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'assets/frame.png',
                                        width: width * 0.9,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment(0.2, 0.05),
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          color: Colors.blue,
                                          height: 5,
                                          width: controller.curSlide == 3 &&
                                                  controller.visible
                                              ? width * 0.4
                                              : 0),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment(0.35, 0),
                                            child: Image.asset(
                                              'assets/left_infotainment.png',
                                              width: width * 0.33,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: AnimatedAlign(
                                            duration:
                                                Duration(milliseconds: 500),
                                            alignment:
                                                controller.curSlide == 3 &&
                                                        controller.visible
                                                    ? Alignment(-0.03, 0)
                                                    : Alignment(-1, 0),
                                            child: AnimatedOpacity(
                                              opacity:
                                                  controller.curSlide == 3 &&
                                                          controller.visible
                                                      ? 1
                                                      : 0,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              child: Image.asset(
                                                'assets/right_infotainment.png',
                                                width: width * 0.33,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AnimatedAlign(
                                      duration: Duration(milliseconds: 500),
                                      alignment: controller.curSlide == 3 &&
                                              controller.visible
                                          ? Alignment(0, 0.32)
                                          : Alignment(0, 0),
                                      child: AnimatedOpacity(
                                        opacity: controller.curSlide == 3 &&
                                                controller.visible
                                            ? 1
                                            : 0,
                                        duration: Duration(milliseconds: 500),
                                        child: Image.asset(
                                          'assets/p2p_service.png',
                                          width: width * 0.3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment(-0.15, -0.12),
                          child: Transform.rotate(
                            angle: pi / 9.0,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 6,
                              height:
                                  controller.curSlide == 3 && controller.visible
                                      ? width * 0.4
                                      : 0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        AnimatedAlign(
                          duration: Duration(milliseconds: 500),
                          alignment:
                              controller.curSlide == 3 && controller.visible
                                  ? Alignment(0.55, -0.2)
                                  : Alignment(0.55, -0.1),
                          child: AnimatedOpacity(
                            opacity:
                                controller.curSlide == 3 && controller.visible
                                    ? 1
                                    : 0,
                            duration: Duration(milliseconds: 500),
                            child: Image.asset(
                              'assets/connected_service.png',
                              width: width * 0.4,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
