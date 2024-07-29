import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../logic/Dashboard/dashboard_base/dashboard_cubit.dart';
import '../../logic/Dashboard/dashboard_base/dashboard_state.dart';
import '../../utils/theme.dart'; // Assuming you're using flutter_svg for SvgPicture



class DashboardScreenPage extends StatefulWidget {
  const DashboardScreenPage({super.key});

  @override
  State<DashboardScreenPage> createState() => _DashboardScreenPageState();
}

class _DashboardScreenPageState extends State<DashboardScreenPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardScreenCubit(),
      child: BlocBuilder<DashboardScreenCubit, DashboardScreenState>(
        builder: (context, state) {
          return Scaffold(
            body: state.screens[state.selectedIndex],
            backgroundColor: ThemeProvider.blackColor,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ThemeProvider.bottomNavColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: state.selectedIndex == 0
                  ? ThemeProvider.buttonColor
                  : ThemeProvider.buttonColor,
              unselectedItemColor: ThemeProvider.whiteColor,
              selectedFontSize: 12,
              elevation: 0,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                  fontFamily: "Lato-Regular",
                  fontWeight: FontWeight.w400
              ),
              unselectedFontSize: 12,
              unselectedLabelStyle: TextStyle(
                  fontFamily: "Lato-Regular",
                  color: ThemeProvider.blackColor,
                  fontWeight: FontWeight.w400
              ),
              onTap: (index) {
                context.read<DashboardScreenCubit>().onItemTapped(index);
              },
              currentIndex: state.selectedIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: state.selectedIndex == 0
                        ? ThemeProvider.buttonColor
                        : ThemeProvider.whiteColor,
                  ),
                  label: 'Home'.tr,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/location.svg",
                    color: state.selectedIndex == 1
                        ? ThemeProvider.buttonColor
                        : null,
                  ),
                  label: 'Location'.tr,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/appointment.svg",
                    color: state.selectedIndex == 2
                        ? ThemeProvider.buttonColor
                        : null,
                  ),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: state.selectedIndex == 3
                        ? ThemeProvider.buttonColor
                        : null,
                  ),
                  label: 'Profile'.tr,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
