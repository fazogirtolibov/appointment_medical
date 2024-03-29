import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/content/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h).r,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            topDoctorsRoute,
          );
        },
        child: Container(
          height: 44.h,
          width: 44.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: const Color(0xff2972FE),
          ),
          child: Center(
            child: SvgPicture.asset(ContentIcons.addCircleOutline,
                color: Colors.white, width: 24.w, height: 24.h),
          ),
        ),
      ),
    );
  }
}
