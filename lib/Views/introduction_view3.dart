import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/landing_view.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_card.dart';
import 'package:sign_language_gp_app/widgets/custom_container.dart';
import 'package:sign_language_gp_app/widgets/custom_position.dart';

class IntroductionView3 extends StatelessWidget {
  const IntroductionView3({super.key});
  static String id = "IntroductionView3";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            //Container With Image
            CustomCard(),
            CustomContainer(
              highLightText: 'تلعم',
              text: 'اساسيات لغة الاشارة بكل سهولة',
              pageId: LandingView.id,
            ),
            //Image
            CustomPosition(image: 'assets/images/SplashScreenImage3.png'),
          ],
        ),
      ),
    );
  }
}
