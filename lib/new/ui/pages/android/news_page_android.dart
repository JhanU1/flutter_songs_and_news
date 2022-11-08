import 'package:flutter/material.dart';

import '../../widgets/new_list_widget.dart';

class NewsPageAndroid extends StatelessWidget {
  const NewsPageAndroid({super.key});
  static const title = "News";
  static const icon = Icon(Icons.library_books);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [Text(title), icon],
        ),
      ),
      body: NewListWidget(),
    );
  }
}
