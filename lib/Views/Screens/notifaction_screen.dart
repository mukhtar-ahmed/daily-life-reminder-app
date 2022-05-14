import 'package:flutter/material.dart';

class NotifactionScreen extends StatefulWidget {
  static const String id = '/notifaction_screen';
  const NotifactionScreen({Key? key}) : super(key: key);

  @override
  State<NotifactionScreen> createState() => _NotifactionScreenState();
}

class _NotifactionScreenState extends State<NotifactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifaction Screen'),
      ),
    );
  }
}
