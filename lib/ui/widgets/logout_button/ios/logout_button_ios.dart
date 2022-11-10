import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../user/controllers/user_controller.dart';

class LogOutButtonIos extends StatelessWidget {
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  const LogOutButtonIos({super.key});

  @override
  Widget build(context) {
    return CupertinoButton(
      color: CupertinoColors.destructiveRed,
      child: const Text('Log out'),
      onPressed: () {
        // You should do something with the result of the action sheet prompt
        // in a real app but this is just a demo.
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              title: const Text('Log out?'),
              message: _logoutMessage,
              actions: [
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () => Get.back<dynamic>(),
                  child: const Text('Reprogram the night man'),
                ),
                CupertinoActionSheetAction(
                  child: const Text('Got it'),
                  onPressed: () async {
                    UserController userController = Get.find();
                    await userController.logout();
                    Get.close(1);
                  },
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () => Get.back<dynamic>(),
                child: const Text('Cancel'),
              ),
            );
          },
        );
      },
    );
  }
}
