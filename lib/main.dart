import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/routes/custom_routes.dart';
import 'package:salon/routes/routes_names.dart';
import 'package:salon/services/navigation_services.dart';
import 'package:salon/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'logic/Authentication/login/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginScreenCubit>(create: (context) => LoginScreenCubit()),
       // BlocProvider<RegistrationSuccessCubit>(create: (context) => RegistrationSuccessCubit()),
       // BlocProvider<LoginScreenCubit>(create: (context) => LoginScreenCubit()),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return   MaterialApp(

        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        title: 'Salon',
        theme: ThemeData(
          scaffoldBackgroundColor: kScaffoldBgColor,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            backgroundColor: kUniversalColor,
            centerTitle: true,
          ),
          fontFamily: 'Delecta',
          colorScheme: ThemeData().colorScheme.copyWith(secondary: kSecendoryColor, primary: kUniversalColor),
          primarySwatch: Colors.blue,
        ),
        initialRoute: splash,
        onGenerateRoute: CustomRoutes.allRoutes,
        navigatorKey: NavigationService.instance.navigationKey,
        navigatorObservers: <NavigatorObserver>[NavigationService.instance.routeObserver],
      );
          }
      ),
    );
  }

}


