import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_button.dart';
import 'package:sign_language_gp_app/widgets/custom_progress_bar.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.highLightText,
    required this.text,
    required this.pageId,
    required this.value,
  });
  final String text, highLightText, pageId;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 450.h),
      height: 500.h,
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
            CustomProgressBar(value: value),
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
