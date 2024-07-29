import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../logic/Authentication/login/login_cubit.dart';
import '../../utils/utils.dart';

class SplashNormalPage extends StatefulWidget {
  const SplashNormalPage({Key? key}) : super(key: key);
  @override
  _SplashNormalPageState createState() => _SplashNormalPageState();
}

class _SplashNormalPageState extends State<SplashNormalPage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  var opacity  = 1.0;


  @override
  void initState() {
    super.initState();

    final bloc = context.read<LoginScreenCubit>();

    bloc.intiShared();

    bloc.getFromShared();

    Timer(Duration(seconds: 2), () {
      opacity = 0.0;
      Timer(Duration(milliseconds: 300), () {
        checkOnboarding() ;
      /*  Navigator.pushNamedAndRemoveUntil(context, onboarding, (route) => false);
        //Get.offAndToNamed(AppRouter.onboading);*/
      });

    });

  }


  Future<void> checkOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingShown = prefs.getBool(Utils.onboardingShown) ?? false;
    String accesToken = prefs.getString(Utils.accesToken) ?? "";
    print("accesToken==== ${prefs.getString(Utils.accesToken)}");

    if (onboardingShown) {
      if(accesToken != null && accesToken != ""){

        Navigator.pushNamedAndRemoveUntil(context, dashboard, (route) => false);

      }else {
        Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, onboarding, (route) => false);
    }
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body:  AnimatedOpacity(
          opacity: 1.0 ,
          duration: Duration(milliseconds: 600),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(image: AssetImage(
                "assets/images/m1_s1_img1.png"
            ),
              fit: BoxFit.cover,
            ),
          ),
        )

    );

  }
}
