import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/introduction_view2.dart';
import 'package:sign_language_gp_app/widgets/custom_card.dart';
import 'package:sign_language_gp_app/widgets/custom_container.dart';
import 'package:sign_language_gp_app/widgets/custom_position.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({
    super.key,
    required this.highLightText,
    required this.text,
    required this.pageIdtoPush,
  });
  final String highLightText, text, pageIdtoPush;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //Container With Image
        CustomCard(),
        CustomContainer(
          highLightText: highLightText,
          text: text,
          pageId: pageIdtoPush,
        ),
        //Image
        CustomPosition(image: 'assets/images/SplashScreenImage1.png'),
      ],
    );
  }
}
