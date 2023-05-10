import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:myfolio/coolers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameWidget = "Adarsh\nSharma."
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
          child: VStack([
            ZStack(
              [
                PictureWidget(),
                Row(
                  children: [
                    VStack([
                      if (context.isMobile) 50.heightBox else 10.heightBox,
                      CustomAppBar().shimmer(primaryColor: Coolers.accentColor),
                      30.heightBox,
                      nameWidget,
                      20.heightBox,
                      VxBox()
                          .color(Coolers.accentColor)
                          .size(60, 10)
                          .make()
                          .px4()
                          .shimmer(primaryColor: Coolers.accentColor),
                      30.heightBox,
                      SocialAccounts(),
                    ]).pSymmetric(
                      h: context.percentWidth * 10,
                      v: 32,
                    ),
                    Expanded(
                      child: VxResponsive(
                        medium: IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60),
                        large: IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60),
                        fallback: const Offstage(),
                      ),
                    )
                  ],
                ).w(context.screenWidth)
              ],
            )
          ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolers.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: VStack(
        [
          [
            " - Introduction".text.gray500.widest.sm.make(),
            10.heightBox,
            "A fresher in the software field who is eager to learn and develop my knowledge and skills."

                .text
                .white
                .xl3
                .maxLines(5)
                .make()
                .w(context.isMobile
                ? context.screenWidth
                : context.percentWidth * 40),
            20.heightBox,
          ].vStack(),
          ElevatedButton(
            onPressed: () {
              launch("https://drive.google.com/drive/folders/1o0g7UtPrJZXCsgW7-enklbXrJx6B9kvD");
            },
            style: ElevatedButton.styleFrom(
              primary: Coolers.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: "My Resume".text.make(),
          ).h(50),
        ],
        // crossAlignment: CrossAxisAlignment.center,
        alignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Coolers.accentColor,
    );
  }
}

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      origin: Offset(context.percentWidth * 2, 0),
      transform: Matrix4.rotationY(pi),
      child: Image.asset(
        "assets/pic.jpg",
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch("https://twitter.com/dev_adarsh286");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch("https://www.instagram.com/adarsh.sharma_93/");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.linkedin_square,
        color: Colors.white,
      ).mdClick(() {
        launch("https://www.linkedin.com/in/adarshsharma-9122as/");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.github,
        color: Colors.white,
      ).mdClick(() {
        launch("https://github.com/Adarshk18");
      }).make()
    ].hStack();
  }
}