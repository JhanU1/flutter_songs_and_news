import 'package:flutter/cupertino.dart';

import '../../widgets/settings_widget.dart';

class SettingsPageIos extends StatelessWidget {
  const SettingsPageIos(
      {super.key, required this.title, required this.iconPage});
  final String title;
  final IconData iconPage;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          children: [
            Text(title),
            Icon(iconPage),
          ],
        ),
      ),
      child: SettingWidget(),
    );
  }
}
