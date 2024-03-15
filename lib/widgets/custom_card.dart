import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w),
      child: Container(
        margin: EdgeInsets.only(top: 60.h),
        height: 400.h,
        width: 320.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black54.withOpacity(0.2),
              spreadRadius: 0.1,
              offset: Offset(4.w, 0),
            ),
          ],
        ),
        child: const Card(),
      ),
    );
  }
}
