import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/dictionary_view.dart';
import 'package:sign_language_gp_app/Views/introduction_view1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_language_gp_app/Views/introduction_view2.dart';
import 'package:sign_language_gp_app/Views/introduction_view3.dart';
import 'package:sign_language_gp_app/Views/landing_view.dart';
import 'package:sign_language_gp_app/Views/learn_view.dart';
import 'package:sign_language_gp_app/Views/setting_view.dart';

void main() => runApp(const SignLanguageGPApp());

class SignLanguageGPApp extends StatelessWidget {
  const SignLanguageGPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: ThemeData(fontFamily: 'Cairo'),
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) => SplashView(),
          IntroductionView2.id: (context) => IntroductionView2(),
          IntroductionView3.id: (context) => IntroductionView3(),
          LandingView.id: (context) => LandingView(),
          SettingView.id: (context) => SettingView(),
          LearnView.id: (context) => LearnView(),
          DictionaryView.id: (context) => DictionaryView(),
        },
        initialRoute: SplashView.id,
      ),
      designSize: const Size(390, 840),
    );
  }
}
