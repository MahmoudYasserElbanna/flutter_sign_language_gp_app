import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language_gp_app/views/about_view.dart';
import 'package:sign_language_gp_app/views/dictionary_view.dart';
import 'package:sign_language_gp_app/views/learn_view.dart';
import 'package:sign_language_gp_app/views/setting_view.dart';
import 'package:sign_language_gp_app/widgets/custom_list_title.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
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
            pageId: LearnView.id,
            iconName: Icons.leaderboard,
          ),
          const Divider(color: Colors.white),
          CustomListTitle(
            title: 'حول التطبيق',
            pageId: AboutView.id,
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
    );
  }
}
