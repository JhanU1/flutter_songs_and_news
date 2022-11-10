import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_design/user/controllers/user_controller.dart';

class LogOutButtonAndroid extends StatelessWidget {
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  const LogOutButtonAndroid({super.key});

  @override
  Widget build(context) {
    return ElevatedButton(
      child: const Text('LOG OUT', style: TextStyle(color: Colors.red)),
      onPressed: () {
        // You should do something with the result of the dialog prompt in a
        // real app but this is just a demo.
        showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Log out?'),
              content: _logoutMessage,
              actions: [
                TextButton(
                    child: const Text('Got it'),
                    onPressed: () async {
                      UserController userController = Get.find();
                      await userController.logout();
                      Get.close(2);
                    }),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Get.back<dynamic>(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
