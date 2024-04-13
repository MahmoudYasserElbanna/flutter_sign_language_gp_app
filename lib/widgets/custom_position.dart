import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPosition extends StatelessWidget {
  const CustomPosition({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 320.h,
      child: Image(
        image: AssetImage(image),
        height: 450.h,
        width: 400.w,
      ),
    );
  }
}
