import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/routes/routes_names.dart';
import 'package:salon/utils/utils.dart';

import '../../../widgets/commontext.dart';
import '../../logic/Authentication/login/login_cubit.dart';
import '../../logic/Authentication/registration_success/registration_success_cubit.dart';
import '../../logic/Authentication/registration_success/registration_success_state.dart';
import '../../utils/theme.dart';

class RegistrationSuccessPage extends StatefulWidget {
  const RegistrationSuccessPage({super.key});

  @override
  State<RegistrationSuccessPage> createState() =>
      _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var opacity  = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    final cubit = context.read<LoginScreenCubit>();



      Timer(Duration(seconds: 2), () {
      opacity = 0.0;
      Timer(Duration(milliseconds: 200), () {

          Navigator.pushNamedAndRemoveUntil(context, dashboard, (route) => false);
      });

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationSuccessCubit(controller: _controller),

      child: BlocBuilder<RegistrationSuccessCubit, RegistrationSuccessState>(
        builder: (context, state) {
          final login_cubit = context.read<LoginScreenCubit>();
          print("login_cubit user secreen_type === ${login_cubit.state.secreen_type}") ;
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/gbl_img2.png"),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: state.scale,
                  child: Image(
                    image: AssetImage("assets/images/m2_s8_img1.png"),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: 0,
                  right: 0,
                  child: login_cubit.state.secreen_type == Utils.register ? reistrationSuccess() : welcome(login_cubit)  /*AnimatedCrossFade(
                    duration: Duration(milliseconds: 300),
                    firstChild: reistrationSuccess(),
                    secondChild: welcome(),
                    crossFadeState: state.isWelcoming
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                  ),*/
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget reistrationSuccess() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/m2_s4_img3.png"),
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          CommonTextWidget(
            heading: "Registration Successful",
            fontSize: 20,
            color: ThemeProvider.blackColor,
            fontFamily: "ManropeSemiBold",
            fontWeight: FontWeight.w800,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CommonTextWidget(
            heading: "Lorem ipsum dolor sit amet consectetur. Egestas.",
            fontSize: 14,
            color: ThemeProvider.greyColor,
            fontFamily: "ManropeRegular",
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Widget welcome(LoginScreenCubit login_cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        CommonTextWidget(
          heading: "Welcome",
          fontSize: 25,
          color: ThemeProvider.blackColor,
          fontFamily: "ManropeSemiBold",
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        CommonTextWidget(
          heading: login_cubit.state.name,
          fontSize: 38,
          color: ThemeProvider.blackColor,
          fontFamily: "ManropeSemiBold",
          fontWeight: FontWeight.w800,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        CommonTextWidget(
          heading: "Looking Good!",
          fontSize: 20,
          color: ThemeProvider.greyColor,
          fontFamily: "ManropeRegular",
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        CommonTextWidget(
          textAlign: TextAlign.center,
          heading: "We have a vast collection of hairstyles to choose from",
          fontSize: 20,
          color: ThemeProvider.greyColor,
          fontFamily: "ManropeRegular",
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
