import 'package:flutter/material.dart';

class ButtomBlue extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const ButtomBlue({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        primary: Colors.blue,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
