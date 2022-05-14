import 'package:flutter/material.dart';

class PlaceAnAddScreen extends StatelessWidget {
  static const String id = '/place_an_add_screen';
  const PlaceAnAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place An add'),
      ),
    );
  }
}
