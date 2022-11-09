import 'package:flutter/material.dart';
import 'package:platform_design/settings/ui/widgets/settings_widget.dart';

class SettingsPageAndroid extends StatelessWidget {
  const SettingsPageAndroid(
      {super.key, required this.title, required this.iconPage});
  final String title;
  final IconData iconPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text(title), Icon(iconPage)],
        ),
      ),
      body: const SettingWidget(),
    );
  }
}
