import 'package:flutter/cupertino.dart';
import 'package:platform_design/new/ui/pages/news_page.dart';
import 'package:platform_design/new/ui/widgets/new_details_widget.dart';
import 'package:platform_design/ui/icons/icons_android.dart';

import '../../../model/new_model.dart';

class NewDetailsPageIos extends StatelessWidget {
  const NewDetailsPageIos({super.key, required this.newModel});
  final New newModel;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Row(
        children: const [Text(NewsPage.title), Icon(IconsAndroid.newsIcon)],
      )),
      child: ListView(
        children: [
          NewDetailsWidget(newModel: newModel),
        ],
      ),
    );
  }
}
