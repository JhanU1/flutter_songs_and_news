import 'package:flutter/material.dart';
import 'package:platform_design/ui/icons/icons_android.dart';

class LoadingPageAndroid extends StatelessWidget {
  const LoadingPageAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(IconsAndroid.songIcon, size: 100)),
    );
  }
}
