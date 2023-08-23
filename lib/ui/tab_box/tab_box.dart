import 'package:doctor_app/cubits/tab/tab_cubit.dart';
import 'package:doctor_app/ui/tab_box/appointment/appointment_screen.dart';
import 'package:doctor_app/ui/tab_box/home/home_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history/history_screen.dart';

class TabBox extends StatefulWidget {
  TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const AppointmentScreen(),
      const HistoryPage(),
      ProfileScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      //drawer: const CustomDrawer(),
      body: BlocBuilder<TabCubit, TabsState>(
        builder: (cubit, state) {
          return Scaffold(
            body: screens[state.currentPage],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.currentPage,
                selectedItemColor: const Color(0xff2972FE),
                unselectedItemColor: Colors.grey.withOpacity(0.6),
                onTap: (value) =>
                    context.read<TabCubit>().changeTabState(value),
                selectedLabelStyle: const TextStyle(color: Colors.grey),
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 25,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_rounded),
                      label: 'Appointment'),

                  // SvgPicture.asset(
                  //   ActionIcons.meeting,
                  //   width: 25,
                  //   height: 25,
                  //   color: state.currentPage == 1
                  //       ? const Color(0xff2972FE)
                  //       : Colors.grey,
                  // ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.history,
                        size: 25,
                      ),
                      label: "History"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 25,
                      ),
                      label: "Profile"),
                ]),
          );
        },
      ),
    );
  }
}
