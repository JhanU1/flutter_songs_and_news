import 'package:flutter/material.dart';

import '../../model/setting_model.dart';
import '../../services/storage.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  final StorageSettings _storageSettings = StorageSettings();

  late final List<Setting> _items;

  @override
  void initState() {
    _items = _storageSettings.settings
        .map((e) => Setting.fromJsonString(e))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _items
            .map((setting) => ListTile(
                  title: Text(setting.title),
                  trailing: Switch.adaptive(
                    value: setting.value,
                    onChanged: (value) => setState(() {
                      setting.value = value;
                      _storageSettings.updateSetting(setting);
                    }),
                  ),
                ))
            .toList());
  }
}
