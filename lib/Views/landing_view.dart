import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingView extends StatelessWidget {
  LandingView({super.key});
  static String id = 'landingView';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.bars,
                color: Colors.black,
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'ادخل النص',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                    ),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.microphone,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
