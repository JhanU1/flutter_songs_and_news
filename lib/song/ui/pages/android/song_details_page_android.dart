import 'package:flutter/material.dart';
import 'package:platform_design/song/model/song_model.dart';
import 'package:platform_design/song/ui/widgets/song_details_widget.dart';

class SongDetailsPageAndroid extends StatelessWidget {
  SongDetailsPageAndroid({super.key, required this.songModel});
  Song songModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songModel.name),
      ),
      body: SongDetailsWidget(songModel: songModel),
    );
  }
}
