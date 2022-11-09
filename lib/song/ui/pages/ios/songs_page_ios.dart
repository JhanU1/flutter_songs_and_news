import 'package:flutter/cupertino.dart';
import 'package:platform_design/song/ui/widgets/song_list_widget.dart';
import 'package:platform_design/utils/utils.dart';

import '../../../../ui/utils/utils.dart';

class SongsPageIos extends StatefulWidget {
  const SongsPageIos({super.key, required this.title, required this.iconPage});
  final String title;
  final IconData iconPage;
  @override
  State<SongsPageIos> createState() => _SongsPageIosState();
}

class _SongsPageIosState extends State<SongsPageIos> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          middle: Row(
            children: [Text(widget.title), Icon(widget.iconPage)],
          ),
          trailing: const CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: togglePlatform,
            child: Icon(CupertinoIcons.shuffle),
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: (() => runAfterDelay(function: () {
                setState(() {
                  // Refresh the list
                });
              })),
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              sliver: SongListWidget()),
        ),
      ],
    );
  }
}
