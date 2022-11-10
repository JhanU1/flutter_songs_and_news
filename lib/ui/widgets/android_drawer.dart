import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../new/ui/pages/news_page.dart';
import '../../profile/ui/pages/profile_page.dart';
import '../../settings/ui/pages/settings_page.dart';
import '../../song/ui/pages/song_page.dart';
import '../icons/icons_android.dart';

class AndroidDrawer extends StatelessWidget {
  const AndroidDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(IconsAndroid.songIcon),
            title: const Text(SongPage.title),
            onTap: () {
              Get.back<dynamic>();
            },
          ),
          ListTile(
            leading: const Icon(IconsAndroid.newsIcon),
            title: const Text(NewsPage.title),
            onTap: () {
              Get.back<dynamic>();
              Get.to<dynamic>(() => const NewsPage());
            },
          ),
          ListTile(
            leading: const Icon(IconsAndroid.profileIcon),
            title: const Text(ProfilePage.title),
            onTap: () {
              Get.back<dynamic>();
              Get.to<dynamic>(() => const ProfilePage());
            },
          ),
          ListTile(
            leading: const Icon(IconsAndroid.settingsIcon),
            title: const Text(SettingsPage.title),
            onTap: () {
              Get.back<dynamic>();
              Get.to<dynamic>(() => const SettingsPage());
            },
          ),
        ],
      ),
    );
  }
}
