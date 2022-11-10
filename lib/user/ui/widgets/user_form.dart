import 'package:flutter/material.dart';
import 'package:platform_design/ui/widgets/text_form_fiel.dart';

import '../../../ui/widgets/button_widget.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> handlerButton() async {}

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
                        print(e);
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
