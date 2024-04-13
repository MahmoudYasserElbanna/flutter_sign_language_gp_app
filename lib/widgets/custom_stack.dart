import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/widgets/custom_card.dart';
import 'package:sign_language_gp_app/widgets/custom_container.dart';
import 'package:sign_language_gp_app/widgets/custom_position.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({
    super.key,
    required this.highLightText,
    required this.text,
    required this.pageIdToPush,
    required this.image,
    required this.value,
  });
  final String highLightText, text, pageIdToPush, image;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //Container With Image
        CustomCard(),
        CustomContainer(
          text: text,
          highLightText: highLightText,
          pageId: pageIdToPush,
          value: value,
        ),
        //Image
        CustomPosition(image: image),
      ],
    );
  }
}
