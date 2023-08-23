import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/color.dart';
import '../../../utils/constants.dart';

Widget onBoardingWidget(
  BuildContext context, {
  required String image,
  required String dutyOfDoctor,
  required String desc1,
  required String desc2,
}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
        image,
      ),
    )),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: myWidth(context),
          height: myHeight(context) * 0.352,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(40).r,
                topRight: const Radius.circular(40).r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: myHeight(context) * 0.041,
              ),
              Center(
                  child: Text(
                dutyOfDoctor,
                style: MyTextStyle.sfProSemiBold.copyWith(
                    color: const Color(0xFF2972FE),
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp),
              )),
              SizedBox(
                height: myHeight(context) * 0.019,
              ),
              Center(
                  child: Text(
                textAlign: TextAlign.center,
                desc1,
                style: MyTextStyle.sfProMedium.copyWith(
                  fontSize: 16.sp,
                  color: MyColors.neutral3,
                ),
              )),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Text(
                  desc2,
                  style: MyTextStyle.sfProMedium.copyWith(
                      fontSize: 16.sp, color: MyColors.neutral1),
                ),
              ),
              SizedBox(
                height: myHeight(context) * 0.08,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
