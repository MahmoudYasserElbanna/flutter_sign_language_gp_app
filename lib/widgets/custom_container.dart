import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_button.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    required this.highLightText,
    required this.text,
    required this.pageId,
  });
  final String text, highLightText, pageId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 450.h),
      height: 400.h,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.h),
            Text(
              highLightText,
              style: TextStyle(
                color: kPrimaryHighLightFontColor,
                fontSize: 28.sp,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              text,
              style: TextStyle(
                color: kPrimaryFontColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            CustomButton(
              buttonLabel: 'التالي',
              buttonColor: kPrimaryColor,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  pageId,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
