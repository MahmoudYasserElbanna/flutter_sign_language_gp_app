import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(.5),
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16),
          color: kPrimaryHighLightFontColor,
          height: 75,
          width: double.infinity,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
