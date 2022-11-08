import 'package:flutter/cupertino.dart';

import '../../../widgets/new_list_widget.dart';

class NewsPageIos extends StatelessWidget {
  const NewsPageIos({super.key});
  static const title = "News";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text(title)),
      child: NewListWidget(),
    );
  }
}
