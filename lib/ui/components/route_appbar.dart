import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/menu_controller.dart';
import 'package:website/ui/common/responsive.dart';
import 'package:website/ui/components/expandable_appbar.dart';
import 'package:website/ui/components/menu_item.dart';

class RouteAppBar extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Obx(
            () => Material(
              elevation: 10,
              child: Container(
                height: 80,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    Icon(Icons.ac_unit),
                    SizedBox(width: 10),
                    Text('PVIS',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(
                          _controller.menuItems.length,
                          (index) => MenuItem(
                            text: _controller.menuItems[index],
                            isActive: index == _controller.selectedIndex,
                            press: _controller.callback[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 10,
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _controller.toggleListener!();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'PVIS',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ExpandableAppBar(controller: _controller),
            ],
          );
  }
}
