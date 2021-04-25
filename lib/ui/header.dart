import 'package:flutter/material.dart';
import 'package:website/constants.dart';
import 'package:website/ui/common/responsive.dart';
import 'package:website/ui/components/header_menu.dart';

class Header extends StatelessWidget {
  Widget makeDesktopHeader() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 80,
            child: HeaderMenu(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 36),
                  child: Text(
                    'Welcome to PVIS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Stay updated with the newest information and development stories, case studies, and insights shared by PVIS Team',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makeNonDesktopHeader() {
    return Container(
      child: Column(
        children: [
          Container(
              height: 60,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      'Welcome to PVIS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 36),
                child: Text(
                  'Stay updated with the newest information and development stories, case studies, and insights shared by PVIS Team',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
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
