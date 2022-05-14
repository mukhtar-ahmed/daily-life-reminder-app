import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeText extends StatelessWidget {
  const CustomeText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.latterSpacing,
    this.color,
    Key? key,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? latterSpacing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          letterSpacing: latterSpacing),
    );
  }
}
