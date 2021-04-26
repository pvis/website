import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:website/controllers/MenuController.dart';
import 'package:website/ui/components/menu_item.dart';

class ExpandableAppBar extends StatefulWidget {
  final MenuController controller;
  ExpandableAppBar({required this.controller});
  @override
  _ExpandableAppBarState createState() => _ExpandableAppBarState();
}

class _ExpandableAppBarState extends State<ExpandableAppBar>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  bool isTaped = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    animation = Tween(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(
          0.000,
          0.800,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
        setState(() {});
      });

    widget.controller.toggleListener = toggle;
  }

  void toggle() {
    if (!isTaped) {
      controller!.forward();
      isTaped = !isTaped;
    } else {
      controller!.reverse();
      isTaped = !isTaped;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggle();
      },
      child: Material(
        color: Colors.transparent,
        child: ClipPath(
          clipper: ArcClipper(),
          child: Container(
            height: animation!.value,
            color: Colors.black,
            child: Column(
              children: List.generate(
                widget.controller.menuItems.length,
                (index) => Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: MenuItem(
                        text: widget.controller.menuItems[index],
                        isActive: index == widget.controller.selectedIndex,
                        press: widget.controller.callback[index],
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  // this class is copied from below url
  //https://flutter.rocks/2017/09/12/from-wireframes-to-flutter-movie-details-page/

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
