import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_language_gp_app/views/about_view.dart';
import 'package:sign_language_gp_app/views/dictionary_view.dart';
import 'package:sign_language_gp_app/views/introduction_view1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_language_gp_app/views/introduction_view2.dart';
import 'package:sign_language_gp_app/views/introduction_view3.dart';
import 'package:sign_language_gp_app/views/landing_view.dart';
import 'package:sign_language_gp_app/views/learn_view.dart';
import 'package:sign_language_gp_app/views/setting_view.dart';
import 'package:sign_language_gp_app/views/splash_view.dart';
import 'package:sign_language_gp_app/firebase_options.dart';
import 'package:sign_language_gp_app/widgets/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const SignLanguageGPApp(),
    ),
  );
}

class SignLanguageGPApp extends StatelessWidget {
  const SignLanguageGPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: const Color(0xffDBDCDF),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            routes: {
              SplashView.id: (context) => const SplashView(),
              IntroView1.id: (context) => const IntroView1(),
              IntroView2.id: (context) => const IntroView2(),
              IntroView3.id: (context) => const IntroView3(),
              LandingView.id: (context) => const LandingView(),
              DictionaryView.id: (context) => const DictionaryView(),
              LearnView.id: (context) => const LearnView(),
              AboutView.id: (context) => const AboutView(),
              SettingView.id: (context) => const SettingView(),
            },
            initialRoute: SplashView.id,
          );
        },
      ),
      designSize: const Size(390, 840),
    );
  }
}
