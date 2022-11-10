import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_design/ui/widgets/text_form_fiel.dart';

import '../../../ui/widgets/button_widget.dart';
import '../../../ui/widgets/custom_snackbar.dart';
import '../../controllers/user_controller.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final UserController _userController = Get.find();

  Future<void> handlerButton() async {
    await _userController.register(
      name: _nameController.text,
      lastName: _lastNameController.text,
      userName: _userNameController.text,
      password: _passwordController.text,
      description: _descriptionController.text,
    );
    Get.back<dynamic>();
    showCustomSnackbar(
      title: 'User added',
      message: 'User added successfully',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        const Text("Sign Up",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 248, 246, 246),
            )),
        const SizedBox(height: 30),
        const SizedBox(height: 20),
        WidgetTextField(
            label: "Name",
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) return "Name is required";
              return null;
            }),
        WidgetTextField(
            label: "Last Name",
            controller: _lastNameController,
            validator: (value) {
              if (value!.isEmpty) return "Last Name is required";
              return null;
            }),
        WidgetTextField(
            label: "User Name",
            controller: _userNameController,
            validator: (value) {
              if (value!.isEmpty) return "User Name is required";
              return null;
            }),
        WidgetTextField(
            label: "Password",
            controller: _passwordController,
            obscure: true,
            validator: (value) {
              if (value!.isEmpty) return "Password is required";
              return null;
            }),
        WidgetTextField(
            label: "Confirm Password",
            controller: _confirmPasswordController,
            obscure: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Confirm Password is required";
              }
              if (value != _passwordController.text) {
                return "Password does not match";
              }
              return null;
            }),
        WidgetTextField(
            label: "Description",
            controller: _descriptionController,
            validator: (value) {
              if (value!.isEmpty) return "Description is required";
              return null;
            }),
        Row(
          children: [
            Expanded(
              child: WidgetButton(
                  text: "Save",
                  onPressed: () async {
                    final form = _formKey.currentState;
                    form!.save();
                    if (form.validate()) {
                      try {
                        await handlerButton();
                      } catch (e) {
                        showCustomSnackbar(
                          title: "Error",
                          message: e.toString(),
                          type: CustomSnackbarType.error,
                        );
                      }
                    }
                  },
                  typeMain: true),
            ),
          ],
        )
      ]),
    );
  }
}
