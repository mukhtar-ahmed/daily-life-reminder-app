import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeRoundButton extends StatelessWidget {
  const CustomeRoundButton({
    Key? key, required this.bgimage, this.color, this.onTap,
  }) : super(key: key);
  final ImageProvider bgimage;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundImage: bgimage,
        backgroundColor: color,
        radius: 30.r,
      ),
    );
  }
}
