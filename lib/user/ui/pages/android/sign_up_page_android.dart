import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_design/user/ui/widgets/user_form.dart';

class SignUpPageAndroid extends StatelessWidget {
  const SignUpPageAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back<dynamic>();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                controller: ScrollController(),
                scrollDirection: Axis.vertical,
                children: [
                  UserForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
