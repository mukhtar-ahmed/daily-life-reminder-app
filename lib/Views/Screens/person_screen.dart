import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  static const String id = '/person_screen';
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Screen'),
      ),
    );
  }
}
