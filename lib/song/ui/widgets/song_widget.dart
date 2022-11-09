import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/song/ui/widgets/song_details_widget.dart';
import 'package:platform_design/ui/widgets/pressable_card.dart';

import '../../model/song_model.dart';

class SongWidget extends StatelessWidget {
  SongWidget({super.key, required this.songModel}) {
    color = defaultTargetPlatform == TargetPlatform.iOS
        ? songModel.color
        : songModel.color.shade400;
  }

  final Song songModel;
  late Color color;
  static const Animation<double> heroAnimation = AlwaysStoppedAnimation(0);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: songModel.id,
      child: AnimatedBuilder(
        animation: heroAnimation,
        builder: (context, child) {
          return PressableCard(
            onPressed: () => SongDetailsWidget(songModel: songModel),
            color: color,
            flattenAnimation: heroAnimation,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // The song title banner slides off in the hero animation.
                Container(
                  height: 80,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    songModel.name,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // The play button grows in the hero animation.
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(Icons.play_arrow,
                      size: 50 + 50 * heroAnimation.value,
                      color: Colors.black38),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
