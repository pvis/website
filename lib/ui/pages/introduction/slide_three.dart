import 'package:flutter/material.dart';

class SlideThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80),
        Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Image.asset(
            'assets/system_overview.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
