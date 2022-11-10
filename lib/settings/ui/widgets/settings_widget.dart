import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/setting_model.dart';
import '../../services/storage.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({super.key});
  final StorageSettings _storageSettings = StorageSettings();

  late final List<Setting> _items;
  @override
  Widget build(BuildContext context) {
    _items = _storageSettings.settings
        .map((e) => Setting.fromJsonString(e))
        .toList();
    return ListView(
        children: _items.map((setting) {
      RxBool sValue = setting.value.obs;
      return ListTile(
          title: Text(setting.title),
          trailing: Obx((() => Switch.adaptive(
                value: sValue.value,
                onChanged: (value) {
                  sValue.value = value;
                  setting.value = value;
                  _storageSettings.updateSetting(setting);
                },
              ))));
    }).toList());
  }
}
