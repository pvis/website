import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/constants/mobile_page.dart';
import 'package:website/constants/web_page.dart';
import 'package:website/controllers/slide_animation_controller.dart';
import 'package:website/ui/common/responsive.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SlideTwo extends StatefulWidget {
  @override
  _SlideTwoState createState() => _SlideTwoState();
}

class _SlideTwoState extends State<SlideTwo> {
  final _player = YoutubePlayerControllerProvider(
    // Passing controller to widgets below.
    controller: YoutubePlayerController(
      initialVideoId: 'Os2xvJTYLjg',
      params: const YoutubePlayerParams(
        // startAt: Duration(minutes: 1, seconds: 36),
        showControls: true,
        showFullscreenButton: false,
        // desktopMode: true,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    ),
    child: YoutubePlayerIFrame(),
  );

  @override
  void initState() {
    super.initState();
  }

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
            Container(
              height: mobilePage
                  ? height * MobilePage.backgroundColorHeightFactor
                  : height * WebPage.backgroundColorHeightFactor,
              width: mobilePage
                  ? height * MobilePage.backgroundColorWidthFactor
                  : width * WebPage.backgroundColorWidthFactor,
              color: Colors.yellow,
            ),
            //image
            Align(
              alignment: !Responsive.isDesktop(context)
                  ? MobilePage.youtubeAlign
                  : WebPage.youtubeAlign,
              child: Container(
                height: mobilePage
                    ? height * MobilePage.imageHeightFactor
                    : height * WebPage.imageWidthFactor,
                width: mobilePage
                    ? width * MobilePage.imageWidthFactor
                    : width * WebPage.imageWidthFactor,
                child: _player,
              ),
            ),

            Expanded(
              child: Align(
                alignment: !Responsive.isDesktop(context)
                    ? MobilePage.headTextAlign
                    : Alignment(-0.8, -0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PVIS Concepts',
                      style: TextStyle(
                        fontSize: mobilePage
                            ? MobilePage.headTextFontSize
                            : WebPage.headTextFontSize,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '    Go to Youtube',
                        style: TextStyle(
                          fontSize: mobilePage
                              ? MobilePage.headTextFontSize * 1 / 2
                              : WebPage.headTextFontSize * 1 / 2,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.9),
              child: GetBuilder<SlideAnimationController>(
                builder: (controller) => IconButton(
                  icon: Icon(Icons.arrow_circle_down),
                  onPressed: () {
                    controller.setCurSlide(2);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
