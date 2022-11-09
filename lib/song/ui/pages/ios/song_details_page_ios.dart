import 'package:flutter/cupertino.dart';
import 'package:platform_design/song/model/song_model.dart';
import 'package:platform_design/song/ui/widgets/song_details_widget.dart';

class SongDetailsPageIos extends StatelessWidget {
  const SongDetailsPageIos({super.key, required this.songModel});
  final Song songModel;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(songModel.name),
        previousPageTitle: 'Songs',
      ),
      child: SongDetailsWidget(songModel: songModel),
    );
  }
}
