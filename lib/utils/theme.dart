
import 'package:flutter/material.dart';

const typeTheme = Typography.whiteMountainView;

class ThemeProvider {
  static const appColor = Color(0xFFF3CB8E);
  static const buttonColor = Color(0xFFF3CB8E);
  static Color blackColor = Color(0xFF303030);
  static const greyColor = Color(0xFF8D8D8D);
  static const hintTextColor = Color(0xFFA09EA6);
  static const dividerColor = Color(0xFFCACACA);
  static Color lightTextColor = Color(0xFF2E2C2C);
  static Color otpFilledColor = Color(0xFFF9F9F9);
  static Color tabbarColor = Color(0xFFC1C3CC);
  static Color iconsColor = Color(0xFF002FFF);
  static Color greenColor = Color(0xFF28A745);
  static Color borderColor = Color(0xFF0C25AE);
  static Color buttonborderColors = Color(0xFF0C25AE);
  static Color primary = Color(0xFF0C25AE);

  static const secondaryAppColor = Color(0xFF0C25AE);
  static const whiteColor = Colors.white;
  static const orangeColor = Color(0xFFFF9900);
  static const darkRedColor = Color(0xFF9A2121);
  static const bottomNavColor = Color(0xFF131C1B);
  static const titleStyle = TextStyle(fontFamily: 'bold', fontSize: 14, color: ThemeProvider.whiteColor);
}

TextTheme txtTheme = Typography.whiteMountainView.copyWith(
  bodyLarge: typeTheme.bodyLarge?.copyWith(fontSize: 16),
  bodyMedium: typeTheme.bodyLarge?.copyWith(fontSize: 14),
  displayLarge: typeTheme.bodyLarge?.copyWith(fontSize: 32),
  displayMedium: typeTheme.bodyLarge?.copyWith(fontSize: 28),
  displaySmall: typeTheme.bodyLarge?.copyWith(fontSize: 24),
  headlineMedium: typeTheme.bodyLarge?.copyWith(fontSize: 21),
  headlineSmall: typeTheme.bodyLarge?.copyWith(fontSize: 18),
  titleLarge: typeTheme.bodyLarge?.copyWith(fontSize: 16),
  titleMedium: typeTheme.bodyLarge?.copyWith(fontSize: 24),
  titleSmall: typeTheme.bodyLarge?.copyWith(fontSize: 21),
);

ThemeData light = ThemeData(fontFamily: 'regular', primaryColor: ThemeProvider.appColor, secondaryHeaderColor: ThemeProvider.secondaryAppColor, disabledColor: const Color(0xFFBABFC4), brightness: Brightness.light, hintColor: const Color(0xFF9F9F9F), cardColor: ThemeProvider.appColor, textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: ThemeProvider.appColor)), textTheme: txtTheme, colorScheme: const ColorScheme.light(primary: ThemeProvider.appColor, secondary: ThemeProvider.secondaryAppColor).copyWith(background: const Color(0xFFF3F3F3)).copyWith(error: const Color(0xFFE84D4F)));

ThemeData dark = ThemeData(fontFamily: 'regular', primaryColor: ThemeProvider.blackColor, secondaryHeaderColor: const Color(0xFF009f67), disabledColor: const Color(0xffa2a7ad), brightness: Brightness.dark, hintColor: const Color(0xFFbebebe), cardColor: Colors.black, textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: ThemeProvider.blackColor)), textTheme: txtTheme, colorScheme: const ColorScheme.dark(primary: Colors.black, secondary: Color(0xFFffbd5c)).copyWith(background: const Color(0xFF343636)).copyWith(error: const Color(0xFFdd3135)));
