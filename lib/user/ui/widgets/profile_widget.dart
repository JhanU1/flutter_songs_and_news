import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_design/user/controllers/user_controller.dart';

import '../../../ui/widgets/logout_button/logout_button.dart';
import '../../../ui/widgets/preference_card.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  '😼',
                  style: TextStyle(
                    fontSize: 80,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Text(
              "@${userController.currentUser.value!.userName}",
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Text("Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                )),
            const SizedBox(height: 10),
            Text(userController.currentUser.value!.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 155, 155, 155),
                  overflow: TextOverflow.ellipsis,
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    )),
                Text(
                  "${userController.currentUser.value!.name} ${userController.currentUser.value!.lastName}",
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 159, 158, 156),
                  ),
                ),
              ],
            ),
            PreferenceCard(
              header: 'MY INTENSITY PREFERENCE',
              content: '🔥',
              preferenceChoices: const [
                'Super heavy',
                'Dial it to 11',
                "Head bangin'",
                '1000W',
                'My neighbor hates me',
              ],
            ),
            PreferenceCard(
              header: 'CURRENT MOOD',
              content: '🤘🏾🚀',
              preferenceChoices: const [
                'Over the moon',
                'Basking in sunlight',
                'Hello fellow Martians',
                'Into the darkness',
              ],
            ),
            const LogOutButton(),
          ],
        ),
      ),
    );
  }
}
