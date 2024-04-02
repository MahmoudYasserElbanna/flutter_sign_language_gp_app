import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/introduction_view2.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_card.dart';
import 'package:sign_language_gp_app/widgets/custom_container.dart';
import 'package:sign_language_gp_app/widgets/custom_position.dart';

class IntroView1 extends StatelessWidget {
  const IntroView1({super.key});
  static String id = 'introductionView1';
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
              highLightText: 'تحويل النص',
              text: 'من صوت الى لغة اشارة عن طريق شخصية ثلاثية الأبعاد',
              pageId: IntroView2.id,
            ),
            //Image
            CustomPosition(image: 'assets/images/SplashScreenImage1.png'),
          ],
        ),
      ),
    );
  }
}
