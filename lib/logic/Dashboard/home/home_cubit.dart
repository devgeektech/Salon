import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';


class HomeScreenCubit extends Cubit<HomeScreenState> {
  late final AnimationController controller;
  late final Animation<double> animation;
  final PageController pageController = PageController();

  HomeScreenCubit()
      : super(
    HomeScreenState(
      onboardingData: [
        "assets/images/cb_img1.png",
        "assets/images/cb_img1.png",
        "assets/images/cb_img1.png",
      ],
      currentPage: 0,
      animationValue: 180,
    ),
  );

  void initializeAnimation(TickerProvider vsync) {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    animation = Tween<double>(begin: 180, end: 0).animate(controller)
      ..addListener(() {
        emit(state.copyWith(animationValue: animation.value));
      });

    pageController.addListener(() {
      if (pageController.page != state.currentPage.toDouble()) {
        emit(state.copyWith(currentPage: pageController.page!.toInt()));
      }
    });

    controller.forward();
  }

  @override
  Future<void> close() {
    pageController.dispose();
    controller.dispose();
    return super.close();
  }
}
