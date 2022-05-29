import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String id = '/chat_screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
    );
  }
}
