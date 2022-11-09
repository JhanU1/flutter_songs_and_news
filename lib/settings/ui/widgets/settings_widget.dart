import 'package:flutter/material.dart';

import '../../model/setting_model.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: Setting.defaultSettings()
            .map((setting) => ListTile(
                  title: Text(setting.title),
                  trailing: Switch.adaptive(
                    value: setting.value,
                    onChanged: (value) => setState(() => setting.value = value),
                  ),
                ))
            .toList());
  }
}
