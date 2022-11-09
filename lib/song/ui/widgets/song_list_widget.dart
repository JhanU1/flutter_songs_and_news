import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/song/ui/widgets/song_widget.dart';

import '../../../utils/utils.dart';
import '../../model/song_model.dart';

class SongListWidget extends StatelessWidget {
  SongListWidget({super.key, this.itemsLength = 20}) {
    _items = generateRandomSongs();
  }

  late List<Song> _items;
  final int itemsLength;

  List<Song> generateRandomSongs() {
    return List.generate(itemsLength, (index) {
      return Song(
        id: index,
        name: getRandomName(),
        color: getRandomColor(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return ListView.builder(
            itemCount: itemsLength,
            itemBuilder: (context, index) =>
                SongWidget(songModel: _items[index]));
      case TargetPlatform.iOS:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            ((context, index) => SongWidget(songModel: _items[index])),
            childCount: itemsLength,
          ),
        );
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
