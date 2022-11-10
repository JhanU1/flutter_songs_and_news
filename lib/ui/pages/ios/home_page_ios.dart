import 'package:flutter/cupertino.dart';

import '../../../new/ui/pages/news_page.dart';
import '../../../user/ui/pages/profile_page.dart';
import '../../../song/ui/pages/song_page.dart';
import '../../icons/icons_ios.dart';

class HomePageIos extends StatelessWidget {
  const HomePageIos({super.key, required this.songsTabKey});
  final Key songsTabKey;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: SongPage.title,
            icon: Icon(IconsIos.songIcon),
          ),
          BottomNavigationBarItem(
            label: NewsPage.title,
            icon: Icon(IconsIos.newsIcon),
          ),
          BottomNavigationBarItem(
            label: ProfilePage.title,
            icon: Icon(IconsIos.profileIcon),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              defaultTitle: SongPage.title,
              builder: (context) => SongPage(key: songsTabKey),
            );
          case 1:
            return CupertinoTabView(
              defaultTitle: NewsPage.title,
              builder: (context) => const NewsPage(),
            );
          case 2:
            return CupertinoTabView(
              defaultTitle: ProfilePage.title,
              builder: (context) => const ProfilePage(),
            );
          default:
            assert(false, 'Unexpected tab');
            return const SizedBox.shrink();
        }
      },
    );
  }
}
