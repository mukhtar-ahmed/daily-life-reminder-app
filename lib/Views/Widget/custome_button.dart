import 'package:daily_life_reminder_app/Views/Widget/custome_text.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    required this.borderColor,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Container(
          height: 60.h,
          width: 375.w,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.all(Radius.circular(30.r))),
          child: CustomeText(
              text: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.w200,
              color: kWhiteColor,
              latterSpacing: 1),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
