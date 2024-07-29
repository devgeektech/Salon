
import 'package:flutter/material.dart';

class DashboardScreenState {
  final int selectedIndex;
  final List<Widget> screens;

  DashboardScreenState({required this.selectedIndex, required this.screens});

  DashboardScreenState copyWith({int? selectedIndex, List<Widget>? screens}) {
    return DashboardScreenState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      screens: screens ?? this.screens,
    );
  }
}
