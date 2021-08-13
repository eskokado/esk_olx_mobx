import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class BaseScreen extends StatelessWidget {


  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
          Container(color: Colors.blue,),
          Container(color: Colors.brown),
        ],
      ),
    );
  }
}