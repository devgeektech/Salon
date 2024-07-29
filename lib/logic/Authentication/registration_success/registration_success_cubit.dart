import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'registration_success_state.dart';

class RegistrationSuccessCubit extends Cubit<RegistrationSuccessState> {
  final AnimationController controller;
  late Animation<double> animation;

  RegistrationSuccessCubit({required this.controller}) : super(const RegistrationSuccessState(scale: 0.0, isWelcoming: false)) {
    _init();
  }

  void _init() {
    final scaleTween = Tween(begin: 0.0, end: 1.0);
    animation = scaleTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      emit(state.copyWith(scale: animation.value));
    });
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.stop();
        Timer(const Duration(seconds: 2), () {
          emit(state.copyWith(isWelcoming: true));
        });
      }
    });
    controller.forward();
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
