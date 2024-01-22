import 'package:flutter/material.dart';

typedef OnPress = void Function();

class Button extends StatelessWidget {
  final OnPress? onPressed;
  const Button({Key? key, this.onPressed, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shadowColor: Colors.transparent, // Untuk menghilangkan shadow
          minimumSize: const Size(double.infinity, 48),
          disabledMouseCursor: SystemMouseCursors.click,
          padding: const EdgeInsets.only(bottom: 10, top: 10),
        ),
        onPressed: onPressed,
        child: Text(
          "$title",
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
