import 'package:flutter/cupertino.dart';

import '../../widgets/new_list_widget.dart';

class NewsPageIos extends StatelessWidget {
  const NewsPageIos({super.key});
  static const title = "News";
  static const icon = Icon(CupertinoIcons.news);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Row(
        children: const [Text(title), icon],
      )),
      child: NewListWidget(),
    );
  }
}
