import 'package:dailymed/Utils/app_Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatelessWidget {
  String? textVal;
  String? imageVal;
  NoDataWidget({
    super.key,
    required this.textVal,
    required this.imageVal
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRect(
              child: Lottie.asset(
            imageVal!,
            height: MediaQuery.of(context).size.height * 0.8,
            width:  MediaQuery.of(context).size.width,
          )),
        ),
        SizedBox(
          height: 200.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: 300.h),
          child: Center(
            child: Text(
              textVal.toString(),
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
    ;
  }
}

Widget noDataFound(context, text, darkTheme) {
  return Stack(
    children: [
      Center(
        child: ClipRect(
            child: Lottie.asset(
          "assets/startups/nodataFound.json",
          width: 300.w,
        )),
      ),
      SizedBox(
        height: 200.h,
      ),
      Padding(
        padding: EdgeInsets.only(top: 300.h),
        child: Center(
            child: Text(
          text.toString(),
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        )),
      )
    ],
  );
}
