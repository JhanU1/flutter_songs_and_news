import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:platform_design/utils/utils.dart';

import '../../../ui/widgets/pressable_card.dart';
import '../../model/new_model.dart';

class NewDetailsWidget extends StatelessWidget {
  NewDetailsWidget({super.key, required this.newModel});
  final New newModel;

  @override
  Widget build(BuildContext context) {
    Animation<double> heroAnimation = const AlwaysStoppedAnimation(1);
    double getHeigthForImage() {
      return MediaQuery.of(context).size.height * 0.30;
    }

    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: newModel.title,
            child: AnimatedBuilder(
              animation: heroAnimation,
              builder: (context, child) {
                return PressableCard(
                  color: newModel.color,
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
                          newModel.title,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                    color: newModel.color,
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
                            newModel.title,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
              height: getHeigthForImage(),
              child: Image.network(getUriForRandomImageWithSize(
                  getRandomNum(100, MediaQuery.of(context).size.width.round()),
                  getHeigthForImage().round()))),
          const Divider(
            height: 0,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 16, bottom: 8),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(newModel.content),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  child: const Text(
                    'More Info',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(lorem(paragraphs: 3, words: 1000))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
