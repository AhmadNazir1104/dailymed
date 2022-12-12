import 'package:dailymed/Utils/app_colors.dart';
import 'package:dailymed/Widgets/custom_text_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SeachTextWidget extends StatelessWidget {
  SeachTextWidget({Key? key, required this.child}) : super(key: key);

  String? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 14.h),
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 10.h,
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: text(
          text: child.toString(),
          size: 14.sp,
        ));
  }
}
