import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/Views/introduction_view1.dart';
import 'package:sign_language_gp_app/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'splashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: animate ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: kPrimaryColor),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: animate ? 30 : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Language App',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom:
                  animate ? MediaQuery.of(context).size.height / 2 - 100 : 0,
              left:
                  animate ? MediaQuery.of(context).size.width / 2 - 100 : -200,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: animate ? 1 : 0,
                  child: const Image(
                    image: AssetImage('assets/images/SplashScreenImage1.png'),
                    width: 200,
                    height: 250,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: animate ? 50 : 0,
              right: 10,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: animate ? 1 : 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    navigate();
  }

  void navigate() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const IntroView1()),
    );
  }
}
