
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../view/Dashboard/home_screen.dart';
import 'dashboard_state.dart';


class DashboardScreenCubit extends Cubit<DashboardScreenState> {
  DashboardScreenCubit() : super(DashboardScreenState(selectedIndex: 0, screens: _screens));

  static final List<Widget> _screens = [
    HomeScreenPage(),
    HomeScreenPage(),
    HomeScreenPage(),
    HomeScreenPage(),
  ];

  void onItemTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
