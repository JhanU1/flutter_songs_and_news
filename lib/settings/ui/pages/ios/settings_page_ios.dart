import 'package:flutter/cupertino.dart';

import '../../widgets/settings_widget.dart';

class SettingsPageIos extends StatelessWidget {
  const SettingsPageIos({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: SettingWidget(),
    );
  }
}
