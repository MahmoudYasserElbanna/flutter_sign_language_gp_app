import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';

class CustomProgressBar extends StatelessWidget {
  final double progressValue;

  const CustomProgressBar({Key? key, required this.progressValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Container(
          height: 32,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kPrimaryColor,
          ),
          child: Container(
            height: 24,
            margin: EdgeInsets.only(
                left: progressValue, top: 6, bottom: 6, right: 8),
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
