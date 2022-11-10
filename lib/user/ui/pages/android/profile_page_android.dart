import 'package:flutter/material.dart';
import 'package:platform_design/user/ui/widgets/profile_widget.dart';

class ProfilePageAndroid extends StatelessWidget {
  const ProfilePageAndroid(
      {super.key, required this.title, required this.iconPage});
  final String title;
  final IconData iconPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(title),
            Icon(iconPage),
          ],
        ),
      ),
      body: SingleChildScrollView(child: ProfileWidget()),
    );
  }
}
