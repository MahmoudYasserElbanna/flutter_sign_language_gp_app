import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/dictionary_view.dart';
import 'package:sign_language_gp_app/Views/introduction_view1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_language_gp_app/Views/introduction_view2.dart';
import 'package:sign_language_gp_app/Views/introduction_view3.dart';
import 'package:sign_language_gp_app/Views/landing_view.dart';
import 'package:sign_language_gp_app/Views/learn_view.dart';
import 'package:sign_language_gp_app/Views/setting_view.dart';
import 'package:sign_language_gp_app/Views/splash_view.dart';
import 'package:sign_language_gp_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SignLanguageGPApp());
}

class SignLanguageGPApp extends StatelessWidget {
  const SignLanguageGPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: ThemeData(fontFamily: 'Cairo'),
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) => const SplashView(),
          IntroView1.id: (context) => const IntroView1(),
          IntroView2.id: (context) => const IntroView2(),
          IntroView3.id: (context) => const IntroView3(),
          LandingView.id: (context) => LandingView(),
          SettingView.id: (context) => const SettingView(),
          LearnView.id: (context) => const LearnView(),
          DictionaryView.id: (context) => const DictionaryView(),
        },
        initialRoute: SplashView.id,
      ),
      designSize: const Size(390, 840),
    );
  }
}
