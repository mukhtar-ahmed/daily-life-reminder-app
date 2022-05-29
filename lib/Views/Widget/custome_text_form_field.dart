import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    Key? key,
    this.icon,
    this.labelText,
    this.hintText,
    this.validate,
    this.textController,
    required this.isObscure,
  }) : super(key: key);
  final IconData? icon;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validate;
  final TextEditingController? textController;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Icon(
            icon,
            size: 20.sp,
            color: kGreyColor,
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: TextFormField(
              controller: textController,
              obscureText: isObscure,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  //labelText: labelText,
                  labelStyle: const TextStyle(color: kGreyColor)),
              validator: validate,
            ),
          ),
        ],
      ),
    );
  }
}
