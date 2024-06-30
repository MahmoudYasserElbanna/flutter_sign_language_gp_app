import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_language_gp_app/widgets/theme_provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  static String id = 'settingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'الوضع الداكن',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Switch(
              value: Provider.of<ThemeProvider>(context).themeMode ==
                  ThemeMode.dark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
