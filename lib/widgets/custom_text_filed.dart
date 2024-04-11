import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
  });
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        //TODO : Implement Speech To Text Code That will retrive the Video.
      },
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
        suffixIcon: IconButton(
          icon: const Icon(
            FontAwesomeIcons.microphone,
          ),
          onPressed: () {
            //TODO: Implement Speech To Text Code.
          },
        ),
      ),
    );
  }
}
