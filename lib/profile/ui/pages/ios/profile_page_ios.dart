import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:platform_design/profile/ui/widgets/profile_widget.dart';
import 'package:platform_design/settings/ui/pages/settings_page.dart';
import 'package:platform_design/ui/icons/icons_ios.dart';

class ProfilePageIos extends StatelessWidget {
  const ProfilePageIos(
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
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(IconsIos.settingsIcon),
          onPressed: () {
            // This pushes the settings page as a full page modal dialog on top
            // of the tab bar and everything.
            Get.to<dynamic>(() => const SettingsPage());
          },
        ),
      ),
      child: const ProfileWidget(),
    );
  }
}
