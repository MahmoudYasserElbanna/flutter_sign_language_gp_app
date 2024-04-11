import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_language_gp_app/widgets/custom_text_filed.dart';
import 'package:sign_language_gp_app/widgets/drawer_body.dart';

class LandingView extends StatelessWidget {
  LandingView({super.key});
  static String id = 'landingView';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        endDrawer: Drawer(
          width: 250.w,
          backgroundColor: kPrimaryColor,
          child: const DrawerBody(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
