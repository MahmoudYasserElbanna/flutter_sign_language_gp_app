import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/landing_view.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_stack.dart';

class IntroView3 extends StatelessWidget {
  const IntroView3({super.key});
  static String id = 'IntroductionView3';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: CustomStack(
          highLightText: 'تعلم',
          text: 'اساسيات لغة الاشارة بكل سهولة',
          pageIdToPush: LandingView.id,
          image: 'assets/images/SplashScreenImage1.png',
        ),
      ),
    );
  }
}
