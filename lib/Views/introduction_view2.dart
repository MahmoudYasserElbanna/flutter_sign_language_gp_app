import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/introduction_view3.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_card.dart';
import 'package:sign_language_gp_app/widgets/custom_container.dart';
import 'package:sign_language_gp_app/widgets/custom_position.dart';

class IntroductionView2 extends StatelessWidget {
  const IntroductionView2({super.key});
  static String id = 'introductionView2';
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
              highLightText: 'قاموس',
              text: 'متوفر لبعض الكلامات حتى يسهل عليك التعبير والبحث فيها',
              pageId: IntroductionView3.id,
            ),
            //Image
            CustomPosition(image: 'assets/images/SplashScreenImage2.png'),
          ],
        ),
      ),
    );
  }
}
