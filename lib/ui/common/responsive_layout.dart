import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const ResponsiveLayout({this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.biggest.width <= 650) {
          return mobile ?? Container();
        }
        if (constraints.biggest.width > 650 &&
            constraints.biggest.width <= 900) {
          return tablet ?? Container();
        }
        return desktop ?? Container();
      },
    );
  }
}
