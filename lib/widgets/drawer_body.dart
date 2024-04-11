import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language_gp_app/Views/dictionary_view.dart';
import 'package:sign_language_gp_app/Views/learn_view.dart';
import 'package:sign_language_gp_app/Views/setting_view.dart';
import 'package:sign_language_gp_app/widgets/custom_list_title.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomListTitle(
          title: 'القاموس',
          pageId: DictionaryView.id,
          iconName: FontAwesomeIcons.book,
        ),
        const Divider(color: Colors.white),
        CustomListTitle(
          title: 'التعليم',
          pageId: LearnView.id,
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
    );
  }
}
