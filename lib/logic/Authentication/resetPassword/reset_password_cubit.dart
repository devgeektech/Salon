
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon/logic/Authentication/resetPassword/reset_password_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/apis_repository.dart';
import '../../../routes/routes_names.dart';
import '../login/login_cubit.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final repository = Repository();
  SharedPreferences? pre;

  ResetPasswordCubit()
      : super(ResetPasswordState(
    errorMessage: '',
    showPassword: false,
    showConfirmPassword: false,
    password: '',
    confirmPassword: '',
    isSubmitting: false,
    loadingState: false,
  ));

  void togglePasswordMode() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void toggleConfirmPasswordMode() {
    emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void setConfirmPassword(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  setNewPassword(BuildContext context) {
    final authB = context.read<LoginScreenCubit>();
    print("authB HelloEmail====>${authB.state.email} ");

    emit(state.copyWith(errorMessage: '', loadingState: true));
    Map<String, Object> json = {
    "email": authB.state.email,
    "newPassword": state.password,
    "reEnterPassword":state.confirmPassword
    };
    print("setNewPassword data ===> " + json.toString());

    repository.setNewPassword(json).then((value) {
      emit(state.copyWith(loadingState: false));

      var deco = jsonDecode(value.body);
      print("setNewPassword response ===> " + deco.toString());

      if (deco['responseCode'] == 200) {

        Fluttertoast.showToast(msg: deco['responseMessage']);

        Navigator.pushNamedAndRemoveUntil(context, login , (route) => false);
      } else {
        Fluttertoast.showToast(msg: deco['responseMessage']);
        emit(state.copyWith(errorMessage: deco['responseMessage'], loadingState: false));
      }
    });
  }


 /* void submit(BuildContext context) {
    emit(state.copyWith(isSubmitting: true));

    Navigator.pushNamed(context, reset_password);
    // Handle the submission logic
    // After the logic is done, set isSubmitting to false
    emit(state.copyWith(isSubmitting: false));
  }*/
}
