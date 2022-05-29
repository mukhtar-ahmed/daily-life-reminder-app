import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: 375.w,
        height: 812.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            /* -------------------------------------------------------------------------- */
            /*                                  Day Name                                  */
            /* -------------------------------------------------------------------------- */
            SizedBox(
              width: double.infinity,
              child: Text(
                'Monday',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            /* -------------------------------------------------------------------------- */
            /*                                Location Name                               */
            /* -------------------------------------------------------------------------- */
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 120.h,
              width: 250.w,
              child: Text(
                'k',
                style: TextStyle(fontSize: 30.sp),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            /* -------------------------------------------------------------------------- */
            /*                                   Weather                                  */
            /* -------------------------------------------------------------------------- */
            Container(
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
              height: 120.h,
              width: 250.w,
              child: Text(
                'k',
                style: TextStyle(fontSize: 30.sp),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            /* -------------------------------------------------------------------------- */
            /*                                    Icon                                    */
            /* -------------------------------------------------------------------------- */
            Container(
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
              height: 120.h,
              width: 250.w,
              child: Text(
                'k',
                style: TextStyle(fontSize: 30.sp),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            /* -------------------------------------------------------------------------- */
            /*                          Search by city and eeload                         */
            /* -------------------------------------------------------------------------- */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                  height: 120.h,
                  width: 150.w,
                ),
                /* -------------------------------------------------------------------------- */
                /*                               Search By City                               */
                /* -------------------------------------------------------------------------- */
                GestureDetector(
                  
                  child: Container(
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
                    height: 120.h,
                    width: 150.w,
                    child: Text(
                      'Search By City Name',
                      style:
                          TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
