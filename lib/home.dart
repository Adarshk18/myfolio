import 'package:flutter/material.dart';
import 'package:myfolio/coolers.dart';
import 'package:myfolio/footer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:myfolio/middle.dart';

import 'header.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolers.primaryColor,
      child: VStack([
        HeaderScreen(),
        if (context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
        FooterScreen(),
      ]).scrollVertical(),
    );
  }
}
