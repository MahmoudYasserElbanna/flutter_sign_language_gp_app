import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language_gp_app/Views/dictionary_view.dart';
import 'package:sign_language_gp_app/Views/setting_view.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_language_gp_app/widgets/custom_list_title.dart';

class LandingView extends StatelessWidget {
  LandingView({super.key});
  static String id = 'landingView';
  final TextEditingController controller = TextEditingController();
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
          child: ListView(
            children: [
              CustomListTitle(
                title: 'القاموس',
                pageId: DictionaryView.id,
                iconName: FontAwesomeIcons.book,
              ),
              const Divider(color: Colors.white),
              CustomListTitle(
                title: 'التعليم',
                pageId: SettingView.id,
                iconName: Icons.leaderboard,
              ),
              const Divider(color: Colors.white),
              CustomListTitle(
                title: 'حول التطبيق',
                pageId: SettingView.id,
                iconName: FontAwesomeIcons.addressCard,
              ),
              const Divider(color: Colors.white),
              CustomListTitle(
                title: 'الإعدادات',
                pageId: SettingView.id,
                iconName: FontAwesomeIcons.gear,
              ),
              const Divider(color: Colors.white),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                onSubmitted: (value) {},
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
