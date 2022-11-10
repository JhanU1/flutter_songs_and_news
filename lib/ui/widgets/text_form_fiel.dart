import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  const WidgetTextField(
      {required this.label,
      required this.controller,
      this.validator,
      this.obscure = false,
      this.numbersOnly = false,
      this.active = true,
      this.maxLine = 1,
      this.keyText = const Key(""),
      super.key});

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool numbersOnly;
  final Key keyText;
  final int maxLine;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: active,
        key: keyText,
        maxLines: maxLine,
        obscureText: obscure,
        keyboardType: numbersOnly
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          labelText: label,
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
