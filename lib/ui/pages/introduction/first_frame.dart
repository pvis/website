import 'package:flutter/material.dart';

class FirstFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                '          Welcome to PVIS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(),
                // child: Image.asset('assets/fig1.png'),
              ),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(MediaQuery.of(context).size.height)),
                  child: Image.asset(
                    'assets/fig1.png',
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
