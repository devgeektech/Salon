/*
import 'package:bloc/bloc.dart';
import 'package:salon/logic/Authentication/verification/verification_state.dart';

class VerificationScreenCubit extends Cubit<VerificationScreenState> {
  VerificationScreenCubit()
      : super(VerificationScreenState(
    otpValue: '',
    isSubmitting: false,
  ));

  *//*void setOtpValue(String otpValue) {
    emit(state.copyWith(otpValue: otpValue));
  }*//*

  void submit() {
    emit(state.copyWith(isSubmitting: true));
    // Handle the submission logic
    // After the logic is done, set isSubmitting to false
    emit(state.copyWith(isSubmitting: false));
  }
}*/
