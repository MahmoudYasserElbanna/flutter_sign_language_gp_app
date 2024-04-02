import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle(
      {super.key,
      required this.title,
      required this.pageId,
      required this.iconName});
  final String title, pageId;
  final IconData iconName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          pageId,
        );
      },
      leading: Icon(
        color: Colors.white,
        iconName,
      ),
    );
  }
}
