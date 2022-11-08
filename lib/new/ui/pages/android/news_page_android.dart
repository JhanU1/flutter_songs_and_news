import 'package:flutter/material.dart';

import '../../../widgets/new_list_widget.dart';

class NewsPageAndroid extends StatelessWidget {
  const NewsPageAndroid({super.key});
  static const title = "News";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: NewListWidget(),
    );
  }
}
