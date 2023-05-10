import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:myfolio/header.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

import 'coolers.dart';

class FooterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              "Got a project?\nLet's talk.".text.center.white.xl2.make(),
              10.heightBox,
              GestureDetector(
                onTap: () {
                  final Uri _emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'dev.adarsh286@gmail.com',
                      query: 'subject=Regarding your project');
                  launch(_emailLaunchUri.toString());
                },
                child: "dev.adarsh286@gmail.com"
                    .text
                    .color(Coolers.accentColor)
                    .semiBold
                    .make()
                    .box
                    .border(color: Coolers.accentColor)
                    .p16
                    .rounded
                    .make(),
              ),
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [
              "Got a project?\nLet's talk.".text.center.white.xl2.make(),
              10.widthBox,
              GestureDetector(
                onTap: () {
                  final Uri _emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'dev.adarsh286@gmail.com',
                      query: 'subject=Regarding your project');
                  launch(_emailLaunchUri.toString());
                },
                child: "dev.adarsh286@gmail.com"
                    .text
                    .color(Coolers.accentColor)
                    .semiBold
                    .make()
                    .box
                    .border(color: Coolers.accentColor)
                    .p16
                    .rounded
                    .make(),
              ),
            ],
            alignment: MainAxisAlignment.spaceAround,
          ).w(context.safePercentWidth * 70).scale150().p16(),
        ),
        50.heightBox,
        CustomAppBar(),
        10.heightBox,
        "Thanks for scrolling, ".richText.semiBold.white.withTextSpanChildren(
            ["that's all folks.".textSpan.gray500.make()]).make(),
        10.heightBox,
        SocialAccounts(),
        30.heightBox,
        [
          "Made in India with".text.red500.make(),
          10.widthBox,
          Icon(
            AntDesign.heart,
            color: Vx.red500,
            size: 14,
          )
        ].hStack(crossAlignment: CrossAxisAlignment.center)
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}
