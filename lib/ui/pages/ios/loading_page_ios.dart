import 'package:flutter/cupertino.dart';
import 'package:platform_design/ui/icons/icons_ios.dart';

class LoadingPageIos extends StatelessWidget {
  const LoadingPageIos({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        child: Center(
      child: Icon(IconsIos.songIcon, size: 100),
    ));
  }
}
