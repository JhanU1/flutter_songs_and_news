import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton(
      {required this.text,
      required this.onPressed,
      required this.typeMain,
      this.keyButton = const Key(""),
      super.key});

  final String text;
  final VoidCallback onPressed;
  final bool typeMain;
  final Key keyButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        key: keyButton,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(typeMain
              ? const Color.fromRGBO(42, 157, 143, 1)
              : const Color.fromRGBO(233, 196, 106, 1)),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
