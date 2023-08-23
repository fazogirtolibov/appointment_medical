import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/color.dart';
import '../../utils/constants.dart';
import '../../utils/icons/app_icons.dart';
import '../widgets/global_button_outline.dart';

class SignInOrSignUpScreen extends StatefulWidget {
  const SignInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignInOrSignUpScreen> createState() => _SignInOrSignUpScreenState();
}

class _SignInOrSignUpScreenState extends State<SignInOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.infoBg,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: myHeight(context) * 0.2,
              ),
              SizedBox(
                height: myHeight(context) * 0.4,
                width: myWidth(context) * 0.4,
                child: Image.asset(AppIcons.logoWithBackground),
              ),
              SizedBox(height: 80.h),
              Text(
                "Welcome to Shifo top!",
                style: MyTextStyle.sfProBold.copyWith(
                    fontSize: 26.sp,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(height: 26.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    signUpPage,
                    (route) => false,
                  );
                },
                child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF0000ff),
                          Color(0xFF0372FE),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30).r,
                    ),
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: MyTextStyle.sfProMedium.copyWith(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ))),
              ),
              SizedBox(height: 16.h),
              GlobalButtonOutline(
                buttonText: 'Sign In',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, loginPage, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
