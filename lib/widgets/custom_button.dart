import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonLabel,
    required this.buttonColor,
    required this.onTap,
  });
  final String? buttonLabel;
  final VoidCallback? onTap;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: buttonColor,
          ),
          child: Center(
            child: Text(
              buttonLabel!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
