import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType keyBoardType;
  final bool isPassWord;

  const CustomInput({
    Key? key,
    required this.icon,
    required this.placeHolder,
    required this.textController,
    this.keyBoardType = TextInputType.text,
    this.isPassWord = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextField(
          controller: textController,
          autocorrect: false,
          keyboardType: keyBoardType,
          obscureText: isPassWord,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: const Color.fromRGBO(187, 186, 185, 1),
            ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeHolder,
          ),
        ));
  }
}
