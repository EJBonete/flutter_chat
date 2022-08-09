import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uId;
  final AnimationController animationController;

  const ChatMessage(
      {Key? key,
      required this.text,
      required this.uId,
      required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: uId == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 5, top: 5, bottom: 5, left: 50),
        decoration: BoxDecoration(
            color: const Color(0xff4d9ef6),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 50, top: 5, bottom: 5, left: 5),
        decoration: BoxDecoration(
            color: const Color(0xffe4e5e8),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
