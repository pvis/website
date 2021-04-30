import 'package:flutter/material.dart';
import 'package:website/ui/common/responsive.dart';
import 'package:website/ui/components/expandable_appbar.dart';
import 'package:website/ui/components/header_menu.dart';

class Header extends StatelessWidget {
  Widget makeDesktopHeader() {
    return Container(
      child: Container(
        height: 80,
        // color: Color(0xff3474e0),
        child: HeaderMenu(),
      ),
    );
  }

  Widget makeNonDesktopHeader() {
    return Column(
      children: [
        HeaderMenu(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
        desktop: makeDesktopHeader(),
        tablet: makeNonDesktopHeader(),
        mobile: makeNonDesktopHeader());
  }
}
