import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({super.key});

  @override
  State<CustomProgressBar> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<CustomProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool finish = false;
  double progressValue = 0.2;
  @override
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LinearProgressIndicator(
              minHeight: 10,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              value: controller.value = progressValue,
            ),
            // ignore: avoid_print
          ],
        ),
      ),
    );
  }
}
