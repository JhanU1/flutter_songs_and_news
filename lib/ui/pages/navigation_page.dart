import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:platform_design/ui/pages/loading_page.dart';
import 'package:platform_design/user/controllers/user_controller.dart';
import 'package:platform_design/user/ui/pages/sign_in_page.dart';

import 'home_page.dart';

class NavegationPage extends StatelessWidget {
  NavegationPage({super.key});
  final RxBool loading = true.obs;

  Future<void> changeLoading() async {
    Future.delayed(const Duration(seconds: 2), () {
      loading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeLoading();
    if (loading.value) {
      return const LoadingPage();
    } else {
      return GetX<UserController>(builder: ((controller) {
        if (controller.currentUser.value == null) {
          return const SignInPage();
        } else {
          return HomePage();
        }
      }));
    }
  }
}
