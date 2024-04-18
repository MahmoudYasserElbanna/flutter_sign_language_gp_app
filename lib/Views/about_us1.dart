import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_language_gp_app/constants.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/aboutUs.gif'),
            Text(
              'Sign Language App',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(24),
              height: 220,
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  textAlign: TextAlign.center,
                  "استعدوا للثورة في عالم التواصل ! نظام الترجمة بالأفاتار جاهز ليدهشكم، فهو يحوّل الكلام إلى لغة الإشارة بأسلوب فريد ومبتكر. مع هذا النظام، لا تحتاجون إلى أن تكونوا محترفين في لغة الإشارة، فهو يقدمها لكم بسهولة وبأسلوب مثير. استعدوا لتجربة جديدة لا مثيل لها في عالم التواصل",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
