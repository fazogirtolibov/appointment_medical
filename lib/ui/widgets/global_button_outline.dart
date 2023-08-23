import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';

class GlobalButtonOutline extends StatelessWidget {
  const GlobalButtonOutline({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.isSmall = false,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback onTap;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.actionPrimaryDefault, width: 2),
        color: const Color(0xff2972FE),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          //shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          buttonText.tr(),
          style: MyTextStyle.sfProSemiBold.copyWith(
            fontSize: 16,
            color: MyColors.actionPrimaryDefault,
          ),
        ),
      ),
    );
  }
}
