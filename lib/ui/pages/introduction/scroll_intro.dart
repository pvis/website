import 'package:flutter/material.dart';

class ScrollIntroPage extends StatelessWidget {
  final scCtrl = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/fig1.png',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
