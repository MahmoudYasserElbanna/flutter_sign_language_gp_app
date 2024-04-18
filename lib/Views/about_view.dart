import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_language_gp_app/views/about_us1.dart';
import 'package:sign_language_gp_app/views/about_us3.dart';
import 'package:sign_language_gp_app/views/about_us2.dart';
import 'package:sign_language_gp_app/views/landing_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});
  static String id = 'aboutView';
  @override
  State<AboutView> createState() => _AboutView();
}

class _AboutView extends State<AboutView> {
  //controller is keeping track on what page we on now
  PageController _controller = PageController();
  //keep track if we are in the last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPageOne(),
            IntroPageTwo(),
            IntroPageThree(),
          ],
        ),
//our dot indicators
        Container(
            alignment: Alignment(0, .90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //Next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            //return landing view
                            return LandingView();
                          }));
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
              ],
            )),
      ]),
    );
  }
}
