import 'package:flutter/material.dart';
import 'package:platform_design/profile/ui/widgets/profile_widget.dart';

class ProfilePageAndroid extends StatelessWidget {
  const ProfilePageAndroid({super.key});
  static const title = 'Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const ProfileWidget(),
    );
  }
}
