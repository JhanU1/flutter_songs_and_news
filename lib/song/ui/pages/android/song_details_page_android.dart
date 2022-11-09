import 'package:flutter/material.dart';
import 'package:platform_design/song/model/song_model.dart';
import 'package:platform_design/song/ui/widgets/song_details_widget.dart';

import '../../widgets/song_list_widget.dart';

class SongDetailsPageAndroid extends StatelessWidget {
  const SongDetailsPageAndroid(
      {super.key,
      required this.songModel,
      this.amountItemsRecommended = 10,
      this.heightItemRecommended = 80});

  final Song songModel;
  final int amountItemsRecommended;
  final double heightItemRecommended;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songModel.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          SongDetailsWidget(songModel: songModel),
          Expanded(
              child: SongListWidget(
                  heightItem: heightItemRecommended,
                  itemsLength: amountItemsRecommended)),
        ],
      ),
    );
  }
}
