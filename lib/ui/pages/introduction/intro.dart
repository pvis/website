import 'package:flutter/material.dart';
import 'package:website/ui/common/responsive.dart';
import 'package:website/ui/pages/introduction/scroll_intro.dart';
import 'package:website/ui/pages/introduction/slide_intro.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? ScrollIntroPage()
        : OrientationBuilder(builder: (ctx, orientation) {
            print(orientation);
            return orientation == Orientation.portrait
                ? ScrollIntroPage()
                : SlideIntroPage();
          });

    // return SlideIntroPage();
  }
}
