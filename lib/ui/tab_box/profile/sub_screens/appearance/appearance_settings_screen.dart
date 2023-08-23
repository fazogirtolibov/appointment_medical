import 'package:doctor_app/ui/tab_box/profile/sub_screens/appearance/widgets/theme_switch_button.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/switch_tile.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppearanceSettingsScreen extends StatefulWidget {
  const AppearanceSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AppearanceSettingsScreen> createState() =>
      _AppearanceSettingsScreenState();
}

class _AppearanceSettingsScreenState extends State<AppearanceSettingsScreen> {
  bool value = false;

  bool value2 = false;


  onChangeMethod(bool newValue) {
    setState(() {
      value = newValue;
    });
  }

  onChangeMethod2(bool newValue2) {
    setState(() {
      value2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        widget:  const SizedBox(),
        title: tr('profile_screen.appearance'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSwitch("dark_mode", value, onChangeMethod),
            SizedBox(height: 16.h),
            const Divider(thickness: 1),
            customSwitch("full_screen_mode", value2, onChangeMethod2),
            const ThemeSwitchButton()
          ],
        ),
      ),
    );
  }
}
