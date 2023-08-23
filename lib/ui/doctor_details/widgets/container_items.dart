import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerItems extends StatelessWidget {
  const ContainerItems({
    super.key,
    required this.image,
    required this.doctorName,
    required this.reviewsCount,
    required this.cardioSpecialist,
    required this.rating,
  });

  final String image;
  final String doctorName;
  final num reviewsCount;
  final String cardioSpecialist;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      margin: EdgeInsets.only( top: 24.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
       boxShadow: [
         BoxShadow(
           color: const Color(0xff121212).withOpacity(0.07),
           blurRadius: 16,
         )
       ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.network(
              image,
              height: 100.h,
              width: 100.w,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. $doctorName",
                  maxLines: 2,
                  style: MyTextStyle.sfProSemiBold.copyWith(
                    fontSize: 22.sp,
                    color: MyColors.neutralBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Specialist - $cardioSpecialist",
                  style: MyTextStyle.sfProRegular.copyWith(
                    fontSize: 14.sp,
                    color: MyColors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      SocialIcons.starHalf,
                      height: 16.h,
                      width: 16.w,
                      color: MyColors.primary,
                    ),
                    Text(
                      "$rating ($reviewsCount reviews)",
                      style: MyTextStyle.sfProLight.copyWith(
                        fontStyle: FontStyle.normal,
                        color: MyColors.neutralBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(width: 20.w)
        ],
      ),
    );
  }
}
