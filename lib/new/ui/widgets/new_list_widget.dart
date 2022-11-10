import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:platform_design/new/ui/widgets/new_widget.dart';

import '../../../utils/utils.dart';
import '../../model/new_model.dart';


class NewListWidget extends StatelessWidget {
  NewListWidget({super.key, this.itemsLength = 20}) {
    _items = generateRandomNews();
  }

  final int itemsLength;
  late final List<New> _items;

  List<New> generateRandomNews() {
    return List.generate(itemsLength, (index) {
      return New(
        color: getRandomColor(),
        title: generateRandomHeadline(),
        content: lorem(paragraphs: 1, words: 24),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsLength,
      itemBuilder: (context, index) => NewWidget(newModel: _items[index]),
    );
  }
}
