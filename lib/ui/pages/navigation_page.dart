import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:platform_design/ui/pages/loading_page.dart';
import 'package:platform_design/user/controllers/user_controller.dart';
import 'package:platform_design/user/ui/pages/sign_in_page.dart';

import '../utils/utils.dart';
import 'home_page.dart';

class NavegationPage extends StatelessWidget {
  NavegationPage({super.key}) {
    changeLoading();
  }
  final RxBool loading = true.obs;

  Future<void> changeLoading() async {
    Future.delayed(const Duration(seconds: 2), () {
      loading.value = false;
      // if (defaultTargetPlatform == TargetPlatform.android) {
      //   togglePlatform();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loading.value) {
        return LoadingPage();
      } else {
        return GetX<UserController>(
          builder: (_) {
            print("User: ${_.currentUser}");
            if (_.currentUser.value == null) {
              return const SignInPage();
            } else {
              return HomePage();
            }
          },
        );
      }
    });
  }
}
