import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/constants.dart';
import 'package:website/controllers/MenuController.dart';

class HeaderMenu extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _controller.menuItems.length,
          (index) => DesktopMenuItem(
            text: _controller.menuItems[index],
            isActive: index == _controller.selectedIndex,
            press: _controller.callback[index],
          ),
        ),
      ),
    );
  }
}

class DesktopMenuItem extends StatefulWidget {
  const DesktopMenuItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  _DesktopMenuItemState createState() => _DesktopMenuItemState();
}

class _DesktopMenuItemState extends State<DesktopMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    } else if (!widget.isActive & _isHover) {
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: HeaderDefaultDuration,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _borderColor(), width: 3),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'NotoSans',
            fontWeight: widget.isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
