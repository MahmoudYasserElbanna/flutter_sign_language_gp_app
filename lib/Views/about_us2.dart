import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'Development Team',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            Image.asset('assets/images/development team.png'),
            const SizedBox(height: 16),
            const Divider(
              thickness: 2,
            ),
            Text(
              'Dataset Recording Team',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            Image.asset('assets/images/development team.png'),
          ],
        ),
      ),
    );
  }
}
