import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_design/song/ui/widgets/song_list_widget.dart';
import 'package:platform_design/ui/widgets/android_drawer.dart';
import 'package:platform_design/utils/utils.dart';

import '../../../../ui/utils/utils.dart';

class SongsPageAndroid extends StatelessWidget {
  SongsPageAndroid({super.key, required this.title, required this.iconPage});

  final String title;
  final IconData iconPage;
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();
  final RxBool refresh = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(title),
              Icon(iconPage),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async =>
                  await _androidRefreshKey.currentState!.show(),
            ),
            const IconButton(
              icon: Icon(Icons.shuffle),
              onPressed: togglePlatform,
            ),
          ],
        ),
        drawer: const AndroidDrawer(),
        body: Obx(() {
          refresh.value;
          return RefreshIndicator(
              key: _androidRefreshKey,
              onRefresh: () {
                return runAfterDelay(function: () {
                  refresh.value;
                });
              },
              child: SongListWidget());
        }));
  }
}
