import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/color.dart';

class Specialist extends StatelessWidget {
  final String color;
  final String imgUrl;
  final String name;
  final String numbers;

  const Specialist(
      {super.key,
      required this.color,
      required this.imgUrl,
      required this.name,
      required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.07),
            blurRadius: 16,
          )
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imgUrl,
            width: 50.w,
          ),
          SizedBox(height: 16.h),
          Text(
            name,
            style: MyTextStyle.sfProSemiBold.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
