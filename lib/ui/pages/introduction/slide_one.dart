import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/slide_animation_controller.dart';

class SlideOne extends GetView<SlideAnimationController> {
  Widget _backgroundWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 80),
              SingleChildScrollView(
                child: Container(
                  child: Image.asset(
                    MediaQuery.of(context).size.width /
                                MediaQuery.of(context).size.height >
                            5 / 3
                        ? 'assets/background_1.png'
                        : 'assets/background_2.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _printPvisWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 3.2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 60),
                              Text(
                                'PVIS',
                                style: TextStyle(
                                    fontSize: 60 *
                                        MediaQuery.of(context).size.width /
                                        1200,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 60),
                              Text(
                                ': ',
                                style: TextStyle(
                                  fontSize: 24 *
                                      MediaQuery.of(context).size.width /
                                      1200,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    99 /
                                    300,
                                child: Text(
                                  'Infotainment Service System for Public Vehicle',
                                  style: TextStyle(
                                    fontSize: 24 *
                                        MediaQuery.of(context).size.width /
                                        1200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
