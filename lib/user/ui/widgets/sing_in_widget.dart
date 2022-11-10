import 'package:flutter/material.dart';
import 'package:platform_design/user/ui/pages/sign_up_page.dart';

import '../../../ui/widgets/button_widget.dart';
import '../../../ui/widgets/text_form_fiel.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void handleButton() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("LogIn",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 236, 231, 231),
                )),
            const SizedBox(height: 30),
            WidgetTextField(
                label: "UserName",
                controller: _userNameController,
                validator: (value) {
                  if (value!.isEmpty) return "UserName is required";
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
            Row(
              children: [
                Expanded(
                  child: WidgetButton(
                      text: "Login",
                      onPressed: () async {
                        final form = _formKey.currentState;
                        form!.save();
                        if (form.validate()) {
                          handleButton();
                        }
                      },
                      typeMain: true),
                ),
              ],
            ),
            Text("¿Do you have an account?"),
            Row(
              children: [
                Expanded(
                  child: WidgetButton(
                      text: "Sing Up",
                      onPressed: () {
                        Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      typeMain: false),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
