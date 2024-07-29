import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/utils.dart';
import 'onboarding_state.dart';
import 'package:salon/data/model/onBoard.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit()
      : super(OnboardingState(
    currentPage: 0,
    onboardingData: [
      OnBoard(
        image: 'assets/images/m1_s1_img2.png',
        title: "Lorem ipsum dolor sit amet",
        description: "Lorem ipsum dolor sit amet consectetur. Aliquam ut at non velit egestas lorem morbi.",
      ),
      OnBoard(
        image: 'assets/images/m1_s1_img3.png',
        title: "Lorem ipsum dolor sit amet",
        description: "Lorem ipsum dolor sit amet consectetur. Aliquam ut at non velit egestas lorem morbi.",
      ),
      OnBoard(
        image: 'assets/images/m1_s1_img4.png',
        title: "Lorem ipsum dolor sit amet",
        description: "Lorem ipsum dolor sit amet consectetur. Aliquam ut at non velit egestas lorem morbi.",
      ),
    ],
  ));

  Future<void> nextPage(BuildContext context) async {
    if (pageController.hasClients) {
      if (state.currentPage < state.onboardingData.length - 1) {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        emit(state.copyWith(currentPage: state.currentPage + 1));
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(Utils.onboardingShown, true);
        Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);

      }
    } else {
      print("PageController has no clients yet.");
    }
  }

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }
}


