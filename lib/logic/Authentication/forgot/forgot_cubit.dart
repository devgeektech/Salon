
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon/routes/routes_names.dart';

import '../../../data/repository/apis_repository.dart';
import '../../../utils/utils.dart';
import '../login/login_cubit.dart';
import 'forgot_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final repository = Repository();
  ForgotPasswordCubit() : super(ForgotPasswordState(isSubmitting: false, email: '' , loadingState: false));

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void submit() {
    emit(state.copyWith(isSubmitting: true));

    // Handle the submission logic
    // After the logic is done, set isSubmitting to false
    emit(state.copyWith(isSubmitting: false));
  }


  forgotPassword(BuildContext context) {


    emit(state.copyWith(errorMessage: '', loadingState: true));
    Map<String, Object> json = {
      "email": state.email!.toString().trim(),
    };
    print("forgotPassword data ===> " + json.toString());

    repository.forgot(json).then((value) {
      emit(state.copyWith(loadingState: false));

      var deco = jsonDecode(value.body);
      print("forgotPassword response ===> " + deco.toString());

      if (deco['responseCode'] == 200) {
        final authB = context.read<LoginScreenCubit>();
        print("authB HelloEmail====>${authB.state.email} ");

        authB.emit(authB.state.copyWith(emaill: state.email!.toString() ,secreenType:Utils.forgot_password ));


        Fluttertoast.showToast(msg: deco['responseMessage']);

        Navigator.pushNamedAndRemoveUntil(context, verification , (route) => false);
      } else {
        Fluttertoast.showToast(msg: deco['responseMessage']);
        emit(state.copyWith(errorMessage: deco['responseMessage'], loadingState: false));
      }
    });
  }


}
