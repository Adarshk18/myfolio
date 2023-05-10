import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.purple700,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "All Creative works,\n"
              .richText
              .withTextSpanChildren(
              ["Selected projects.".textSpan.yellow400.make()])
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              items: [
                ProjectWidget(
                  title: "E-Manager",
                  url: "https://github.com/Adarshk18/e-manager_project",
                ),
                ProjectWidget(
                  title: "Trektonic",
                  url: "https://github.com/Adarshk18/trektonic",
                ),
                ProjectWidget(
                  title: "DailyMeals",
                  url: "https://github.com/Adarshk18/dailymeals_project",
                ),
                ProjectWidget(
                  title: "TicTacToe",
                  url: "https://github.com/Adarshk18/TIC-TAC-TOE-GAME",
                ),
                ProjectWidget(
                  title: "ShopMaven",
                  url: "https://github.com/Adarshk18/shopaholic",
                ),
              ],
              height: 170,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;
  final String url;

  ProjectWidget({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: title.text.bold.white.xl.wide.center
          .make()
          .box
          .p8
          .roundedLg
          .neumorphic(
        color: Vx.purple700,
        elevation: 5,
        curve: VxCurve.flat,
      )
          .alignCenter
          .square(200)
          .make()
          .p16(),
    );
  }
}
