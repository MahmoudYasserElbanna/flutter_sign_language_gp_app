import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmit;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmit,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: 'ادخل النص',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: IconButton(
          icon: const Icon(
            FontAwesomeIcons.trash,
          ),
          onPressed: () {
            controller.clear();
          },
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
              ),
              onPressed: () {
                onSubmit(controller.text);
              },
            ),
            Container(
              height: 24,
              child: VerticalDivider(
                width: 1,
                color: Colors.grey.shade400,
              ),
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.microphone,
              ),
              onPressed: () {
                //TODO : Handle microphone button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
