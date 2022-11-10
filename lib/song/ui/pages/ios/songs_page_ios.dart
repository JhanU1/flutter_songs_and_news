import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:platform_design/song/ui/widgets/song_list_widget.dart';
import 'package:platform_design/utils/utils.dart';

import '../../../../ui/utils/utils.dart';

class SongsPageIos extends StatelessWidget {
  SongsPageIos({super.key, required this.title, required this.iconPage});
  final String title;
  final IconData iconPage;
  final RxBool refresh = true.obs;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          middle: Row(
            children: [Text(title), Icon(iconPage)],
          ),
          trailing: const CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: togglePlatform,
            child: Icon(CupertinoIcons.shuffle),
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: (() => runAfterDelay(function: () {
                refresh.refresh();
              })),
        ),
        Obx(() {
          refresh.value;
          return SliverSafeArea(
            top: false,
            sliver: SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                sliver: SongListWidget()),
          );
        }),
      ],
    );
  }
}
