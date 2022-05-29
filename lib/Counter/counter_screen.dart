import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late int count;

  @override
  void initState() {
    count = 0;
    super.initState();
    initialize();
  }

  void initialize() async {
    setState(() async {
      var a = await firebaseFirestore.collection('counter').doc('id').get();
      count = a.data()!['totalCount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          CircleAvatar(
              radius: 200.r,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                radius: 150.r,
                backgroundColor: Colors.black,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 120.r,
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                          fontSize: 80.sp, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    count = 0;
                  });
                },
                child: Container(
                  height: 100,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.restart_alt,
                    size: 50.r,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  firebaseFirestore
                      .collection('counter')
                      .doc('id')
                      .update({'totalCount': count});
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.w900),
                    )),
              )
            ],
          )
        ],
      ),
    ));
  }
}
