import 'package:flutter/cupertino.dart';
import 'package:platform_design/profile/ui/widgets/profile_widget.dart';

import '../../../../ui/pages/settings_tab.dart';

class ProfilePageIos extends StatelessWidget {
  const ProfilePageIos({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: SettingsTab.iosIcon,
          onPressed: () {
            // This pushes the settings page as a full page modal dialog on top
            // of the tab bar and everything.
            Navigator.of(context, rootNavigator: true).push<void>(
              CupertinoPageRoute(
                title: SettingsTab.title,
                fullscreenDialog: true,
                builder: (context) => const SettingsTab(),
              ),
            );
          },
        ),
      ),
      child: const ProfileWidget(),
    );
  }
}
