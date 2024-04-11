import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/introduction_view3.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_stack.dart';

class IntroView2 extends StatelessWidget {
  const IntroView2({super.key});
  static String id = 'introductionView2';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: CustomStack(
          highLightText: 'قاموس',
          text: 'متوفر لبعض الكلامات حتى يسهل عليك التعبير والبحث فيها',
          pageIdToPush: IntroView3.id,
          image: 'assets/images/IntroViewImage2Preview.png',
        ),
      ),
    );
  }
}
