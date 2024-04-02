import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({super.key});

  @override
  State<CustomProgressBar> createState() => _CustomProgressBar();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _CustomProgressBar extends State<CustomProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        height: 32,
        child: LinearProgressIndicator(
          color: Colors.black,
          backgroundColor: kPrimaryColor,
          minHeight: 10,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          value: controller.value = 0.5,
        ),
      ),
    );
  }
}
