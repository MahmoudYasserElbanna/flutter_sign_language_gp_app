import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/category.dart';

class LearnView extends StatelessWidget {
  const LearnView({super.key});
  static String id = 'learnView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: CircleAvatar(
              radius: 120,
              backgroundColor: kPrimaryHighLightFontColor,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 118,
                backgroundImage: AssetImage('assets/images/LearnImage.png'),
              ),
            ),
          ),
          Category(
            text: 'الحروف الابجدية',
            color: kPrimaryHighLightFontColor,
            onTap: () {},
          ),
          Category(
              text: 'الأرقام', color: kPrimaryHighLightFontColor, onTap: () {}),
          Category(
            text: 'الأسرة',
            color: kPrimaryHighLightFontColor,
            onTap: () {},
          ),
          Category(
            text: 'الملابس',
            color: kPrimaryHighLightFontColor,
            onTap: () {},
          ),
          Category(
            text: 'ايام الأسبوع',
            color: kPrimaryHighLightFontColor,
            onTap: () {},
          ),
          Category(
            text: 'الشهور',
            color: kPrimaryHighLightFontColor,
            onTap: () {},
          ),
          Category(
            text: 'الصلاه',
            color: kPrimaryHighLightFontColor,
            onTap: () {},
          ),
          Category(
            text: 'الألوان',
            color: kPrimaryHighLightFontColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
