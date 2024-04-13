import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';

class CustomProgressBar extends StatelessWidget {
  final double value;

  const CustomProgressBar({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(16),
          value: value,
          minHeight: 24,
          backgroundColor: Colors.grey[400],
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
      ),
    );
  }
}
