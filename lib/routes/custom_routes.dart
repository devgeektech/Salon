import 'package:flutter/material.dart';
import 'package:salon/routes/routes_names.dart';
import 'package:salon/view/Authentication/login.dart';
import '../view/Authentication/forgot.dart';
import '../view/Authentication/registration_success.dart';
import '../view/Authentication/reset_password.dart';
import '../view/Authentication/verification.dart';
import '../view/Onboarding/splash.dart';
import '../view/Dashboard/dashboard.dart';
import '../view/not_found.dart';
import '../view/Onboarding/onboarding.dart';


class CustomRoutes {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(builder: (_) =>  SplashNormalPage());
      case onboarding:
        return MaterialPageRoute(builder: (_) =>  OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) =>  LoginScreenPage());
      case forgot:
        return MaterialPageRoute(builder: (_) =>  ForgotPasswordPage());
      case reset_password:
        return MaterialPageRoute(builder: (_) =>  ResetPasswordPage());
      case verification:
        return MaterialPageRoute(builder: (_) =>  VerificationScreenPage());
     case dashboard:
        return MaterialPageRoute(builder: (_) =>  DashboardScreenPage());
      case registration_success:
        return MaterialPageRoute(builder: (_) =>  RegistrationSuccessPage());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
