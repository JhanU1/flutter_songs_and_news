import 'package:flutter/cupertino.dart';
import 'package:platform_design/song/model/song_model.dart';
import 'package:platform_design/song/ui/widgets/song_details_widget.dart';

import '../../widgets/song_list_widget.dart';

class SongDetailsPageIos extends StatelessWidget {
  const SongDetailsPageIos(
      {super.key,
      required this.songModel,
      this.amountItemsRecommended = 10,
      this.heightItemRecommended = 80});
  final Song songModel;
  final int amountItemsRecommended;
  final double heightItemRecommended;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(songModel.name),
      ),
      child: CustomScrollView(
        slivers: [
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                sliver: SliverToBoxAdapter(
                  child: SongDetailsWidget(songModel: songModel),
                )),
          ),
          SongListWidget(itemsLength: 10, heightItem: 80),
        ],
      ),
    );
  }
}
