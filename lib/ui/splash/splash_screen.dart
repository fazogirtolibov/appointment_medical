import 'package:doctor_app/data/repositories/storage_repository.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage() {
    Future.delayed(const Duration(seconds: 3), () async {
      String response = await StorageRepository.getUserId();
      if (response.isEmpty) {
        Navigator.pushReplacementNamed(context, onBoarding);
      } else if (response == "log_out") {
        Navigator.pushNamedAndRemoveUntil(
            context, signInOrSignUp, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, tabBox, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: myHeight(context) * 0.139,
          ),
          Center(
            child: SizedBox(
              height: myHeight(context) * 0.2,
              width: myWidth(context) * 0.6,
              child: Image.asset(
                AppIcons.logoWithBackground,
              ),
            ),
          ),
          SizedBox(
            height: myHeight(context) * 0.139,
          ),
          const CircularProgressIndicator(color: Color(0xff0000ff),)
        ],
      ),
    );
  }
}
