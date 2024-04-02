// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login/pages/login.dart';
// import 'package:login/pages/bottomnavbar.dart';
// import 'package:sign_language_gp_app/Views/introduction_view1.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   bool animate = false;
//   @override
//   void initState() {
//     super.initState();
//     startanimation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 2400),
//               top: animate ? 0 : -30,
//               left: animate ? 0 : -30,
//               child: AnimatedOpacity(
//                 duration: Duration(milliseconds: 2000),
//                 opacity: animate ? 1 : 0,
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.black),
//                 ),
//               ),
//             ),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 1600),
//               top: 80,
//               left: animate ? 30 : -80,
//               child: AnimatedOpacity(
//                 duration: Duration(milliseconds: 1600),
//                 opacity: animate ? 1 : 0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Time Notes',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 2400),
//               bottom:
//                   animate ? MediaQuery.of(context).size.height / 2 - 100 : 0,
//               left:
//                   animate ? MediaQuery.of(context).size.width / 2 - 100 : -200,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: AnimatedOpacity(
//                     duration: Duration(milliseconds: 2000),
//                     opacity: animate ? 1 : 0,
//                     child: Image(
//                       image: AssetImage('assets/logoo.png'),
//                       width: 200,
//                       height: 250,
//                     )),
//               ),
//             ),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 2400),
//               bottom: animate ? 50 : 0,
//               right: 10,
//               child: AnimatedOpacity(
//                 duration: Duration(milliseconds: 2000),
//                 opacity: animate ? 1 : 0,
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.orangeAccent),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future startanimation() async {
//     await Future.delayed(Duration(milliseconds: 1000));
//     setState(() {
//       animate = true;
//     });
//     await Future.delayed(Duration(milliseconds: 3000));
//     navigate();
//   }

//   void navigate() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null && user.emailVerified) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
//       );
//     } else {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => SplashView()),
//       );
//     }
//   }
// }
