import 'package:doctor_app/cubits/speciality/speciality_cubit.dart';
import 'package:doctor_app/ui/tab_box/home/widgets/home_appbar.dart';
import 'package:doctor_app/ui/tab_box/home/widgets/specialist_item2.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/icons/file/file.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeAppbar(
        logo: FileIcons.logo,
        title: "Shifo Top",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 14.w).r,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w).r,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    Navigator.pushNamed(context, doctorsSearchRoute);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h).r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.grey[100]),
                    child: Row(
                      children: [
                        Text(
                          "search for doctors",
                          style: MyTextStyle.sfProLight
                              .copyWith(color: MyColors.neutral4),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.search,
                          color: Colors.grey[400],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w).r,
                child: Row(
                  children: [
                    Text(
                      'All categories',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        color: MyColors.neutral4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: SizedBox(
                  height: myHeight(context) * 0.8,
                  child: BlocBuilder<SpecialityCubit, SpecialityState>(
                    builder: (context, state) {
                      if (state is SpecialityInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is SpecialitySuccess) {
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.specialistModel.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3).r,
                                child: GestureDetector(
                                  onTap: () {
                                    debugPrint(state.specialistModel[index].id);
                                    Navigator.pushNamed(
                                      context,
                                      specialDoctor,
                                      arguments: {
                                        'specialistId':
                                            state.specialistModel[index].id,
                                        'specialName':
                                            state.specialistModel[index].title,
                                      },
                                    );
                                  },
                                  child: Specialist(
                                      color:
                                          "0xFF${state.specialistModel[index].color}",
                                      imgUrl:
                                          state.specialistModel[index].iconPath,
                                      name: state.specialistModel[index].title,
                                      numbers: state
                                          .specialistModel[index].doctorsCount
                                          .toString()),
                                ),
                              );
                            });
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
