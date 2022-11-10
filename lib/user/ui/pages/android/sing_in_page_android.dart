import 'package:flutter/material.dart';
import 'package:platform_design/user/ui/widgets/sing_in_widget.dart';

class SignInPageAndroid extends StatelessWidget {
  const SignInPageAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListView(
              children: [
                LoginWidget(),
              ],
            )));
  }
}
