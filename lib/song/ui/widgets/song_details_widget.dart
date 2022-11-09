import 'package:flutter/material.dart';
import 'package:platform_design/song/ui/widgets/song_list_widget.dart';
import 'package:platform_design/ui/widgets/pressable_card.dart';

import '../../model/song_model.dart';

class SongDetailsWidget extends StatelessWidget {
  const SongDetailsWidget(
      {super.key,
      required this.songModel,
      this.lengthItemsRecommended = 8,
      this.heightItemRecommended = 80});
  final Song songModel;
  final int lengthItemsRecommended;
  final double heightItemRecommended;
  @override
  Widget build(BuildContext context) {
    Animation<double> heroAnimation = const AlwaysStoppedAnimation(1);
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: songModel.id,
            child: AnimatedBuilder(
              animation: heroAnimation,
              builder: (context, child) {
                return PressableCard(
                  color: songModel.color,
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
            // This app uses a flightShuttleBuilder to specify the exact widget
            // to build while the hero transition is mid-flight.
            //
            // It could either be specified here or in SongsTab.
            flightShuttleBuilder: (context, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return PressableCard(
                    color: songModel.color,
                    flattenAnimation: animation,
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
                              size: 50 + 50 * animation.value,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: Image.network(songModel.linkImage)),
          const Divider(
            height: 0,
            color: Colors.grey,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 16, bottom: 8),
            child: Text(
              'You might also like:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
              child: SongListWidget(
            itemsLength: lengthItemsRecommended,
            heightItem: heightItemRecommended,
          )),
        ],
      ),
    );
  }
}
