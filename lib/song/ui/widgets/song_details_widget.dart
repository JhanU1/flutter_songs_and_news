import 'package:flutter/material.dart';
import 'package:platform_design/ui/widgets/pressable_card.dart';

import '../../model/song_model.dart';

class SongDetailsWidget extends StatelessWidget {
  const SongDetailsWidget({super.key, required this.songModel});
  final Song songModel;
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
          const Divider(
            height: 0,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 15, top: 16, bottom: 8),
                    child: Text(
                      'You might also like:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }
                // Just a bunch of boxes that simulates loading song choices.
                return SizedBox(
                  height: 95,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          width: 130,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 9,
                                margin: const EdgeInsets.only(right: 60),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 20, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 40, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 80, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              Container(
                                height: 9,
                                margin:
                                    const EdgeInsets.only(right: 50, top: 8),
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
