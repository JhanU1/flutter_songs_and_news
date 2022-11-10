import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_design/new/ui/widgets/new_details_widget.dart';

import '../../../model/new_model.dart';

class NewDetailsPageAndroid extends StatelessWidget {
  const NewDetailsPageAndroid(
      {super.key, required this.newModel, required this.titlePage});
  final New newModel;
  final String titlePage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage),
        leading: IconButton(
            onPressed: () {
              Get.back<dynamic>();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(child: NewDetailsWidget(newModel: newModel)),
    );
  }
}
