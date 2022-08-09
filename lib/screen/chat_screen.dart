import 'dart:io';
import 'package:chat/screen/screen.dart';
import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _TextControler = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessage> _messages = [];
  bool _isWrited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Column(children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
              child: const Text('Te', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 3),
            const Text('Melisa flores',
                style: TextStyle(color: Colors.black87, fontSize: 12)),
          ]),
          elevation: 2,
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _messages.length,
                      itemBuilder: (_, index) => _messages[index])),
              const Divider(
                height: 1,
              ),
              Container(
                //Caja de texto
                color: Colors.white,
                child: _inputChat(),
              )
            ],
          ),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _TextControler,
            onSubmitted: _handleSubmit,
            onChanged: (text) {
              setState(() {
                if (text.trim().isNotEmpty) {
                  _isWrited = true;
                } else {
                  _isWrited = false;
                }
              });
            },
            decoration:
                const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: const Text('enviar'),
                    onPressed: () {
                      _isWrited
                          ? () => _handleSubmit(_TextControler.text.trim())
                          : null;
                    })
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: const Icon(Icons.send),
                          onPressed: _isWrited
                              ? () => _handleSubmit(_TextControler.text)
                              : null),
                    )),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String text) {
    if (text.isEmpty) return;
    debugPrint(text);
    _TextControler.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: text,
      uId: '553',
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _isWrited = false;
    });
  }

  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
