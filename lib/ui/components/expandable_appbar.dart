import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:website/controllers/menu_controller.dart';
import 'package:website/ui/common/arc_clipper.dart';
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
            color: Colors.white,
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
