import 'package:flutter/material.dart';

import '../../widgets/new_list_widget.dart';

class NewsPageAndroid extends StatelessWidget {
  const NewsPageAndroid(
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
      body: NewListWidget(),
    );
  }
}
