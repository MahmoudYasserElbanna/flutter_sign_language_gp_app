import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({required this.text, required this.color, required this.onTap});
  String text;
  Color color;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(.5),
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          color: color,
          height: 75,
          width: double.infinity,
        ),
      ),
    );
  }
}
