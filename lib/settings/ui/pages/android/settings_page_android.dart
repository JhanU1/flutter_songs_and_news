import 'package:flutter/material.dart';
import 'package:platform_design/settings/ui/widgets/settings_widget.dart';

class SettingsPageAndroid extends StatelessWidget {
  const SettingsPageAndroid({super.key});
  static const title = 'Settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const SettingWidget(),
    );
  }
}
